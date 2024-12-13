## -----------------------------------------------------------------------------
## Make targets to test Terraform deployments locally.
## -----------------------------------------------------------------------------

# Global variables with a default value. Override as needed when invoking make.
AWS_REGION?=""
AWS_KEY_NAME?=""
AWS_VPC_ID?=""
AWS_SUBNET_ID?=""
AWS_INSTANCE_TYPE?=""
SLACK_WEBHOOK_URL?=""

# Static variables.
PLAN_FILEPATH=plan.tfplan
STATE_FILEPATH=terraform.tfstate

# Define reusable Terraform output commands
TERRAFORM_OUTPUT=terraform output -state=${STATE_FILEPATH} -no-color
GET_PUBLIC_IP=${TERRAFORM_OUTPUT} -raw PublicIpAddress
GET_INSTANCE_ID=${TERRAFORM_OUTPUT} -raw InstanceId

define DEFAULT_ARGS
-var region=${AWS_REGION} \
-var key_name=${AWS_KEY_NAME} \
-var instance_type=${AWS_INSTANCE_TYPE} \
-var subnet_id=${AWS_SUBNET_ID} \
-var vpc_id=${AWS_VPC_ID}
endef

# Avoid name collisions between targets and files.
.PHONY: help fmt init validate plan apply check-outputs verify validate-instance plan-destroy destroy clean notify-slack

# A target to format and present all supported targets with their descriptions.
help : Makefile
		@sed -n 's/^##//p' $<

## fmt			: Run terraform fmt.
fmt:
	terraform fmt -check=true -diff

## init 			: Run terraform init.
init:
	terraform init

## validate 		: Run terraform validate.
validate:
	terraform validate

## plan 			: Run terraform plan.
plan:
	terraform plan ${DEFAULT_ARGS} -out=${PLAN_FILEPATH} -no-color -input=false

## apply 			: Run terraform apply.
apply:
	terraform apply ${DEFAULT_ARGS} -auto-approve -input=false

## check-outputs 		: Check for required Terraform outputs.
check-outputs:
	@if ${TERRAFORM_OUTPUT} | grep -q "PublicIpAddress" && ${TERRAFORM_OUTPUT} | grep -q "InstanceId"; then \
		echo "Required outputs are present."; \
	else \
		echo "Error: Required outputs \"PublicIpAddress\" and/or \"InstanceId\" not found. Terminating the instance."; \
		make plan-destroy; \
		make destroy; \
		exit 1; \
	fi

## verify  		: Verify if the desired outcome was achieved and run destroy.
verify: check-outputs
	make validate-instance

## validate-instance 	: Validate the instance and its OS type.
validate-instance:
	@PUBLIC_IP=$$(${GET_PUBLIC_IP}); \
	INSTANCE_ID=$$(${GET_INSTANCE_ID}); \
	OS_TYPE=$$(ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/keys/${AWS_KEY_NAME} ec2-user@$$PUBLIC_IP "uname -o"); \
	if [ "$$OS_TYPE" = "GNU/Linux" ]; then \
		echo "Instance is running $$OS_TYPE"; \
		make notify-slack STATUS=success; \
		make plan-destroy; \
		make destroy; \
	else \
		echo "$$OS_TYPE is an invalid OS. Terminating the instance."; \
		make notify-slack STATUS=deploy-failed; \
		make plan-destroy; \
		make destroy; \
	fi

## notify-slack 		: Send a Slack notification.
notify-slack:
	@./slack_notify.sh ${SLACK_WEBHOOK_URL} ${STATUS} "Terraform Deployment"

## plan-destroy 		: Run terraform plan destroy.
plan-destroy:
	terraform plan -destroy ${DEFAULT_ARGS} -out=${PLAN_FILEPATH}

## destroy 		: Run terraform destroy.
destroy:
	terraform destroy -auto-approve ${DEFAULT_ARGS}

## clean			: Find and remove all terraform cache files.
clean:
	@find . -name ".terraform" -type d -print0 | xargs -0 -I {} rm -rf "{}"
	@find . -name ".terraform.lock.hcl" -type f -print0 | xargs -0 -I {} rm -rf "{}"
	@find . -name "plan.tfplan" -type f -print0 | xargs -0 -I {} rm -rf "{}"
	@find . -name "terraform.tfstate*" -type f -print0 | xargs -0 -I {} rm -rf "{}"