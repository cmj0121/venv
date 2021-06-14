.PHONY: all clean help

all:  		# build
	@echo "deploy the AWS codebuild (GitHub) via terraform"

clean:		# clean-up

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'


init:					# setup the terraform environment
	terraform init

apply: 					# deply the lambda directly
	terraform apply

destroy:				# destroy the lambda
	terraform destroy
