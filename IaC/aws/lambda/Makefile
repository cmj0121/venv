.PHONY: all clean help

all:  		# build
	@echo "deploy the AWS lambda from local .zip file via terraform"

clean:		# clean-up

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'


LAMBDA_ZIP := lambda.zip
$(LAMBDA_ZIP): lambda_function.py
	zip $@ $<

init:					# setup the terraform environment
	terraform init

apply: $(LAMBDA_ZIP)	# deply the lambda directly
	terraform apply

destroy:				# destroy the lambda
	terraform destroy
