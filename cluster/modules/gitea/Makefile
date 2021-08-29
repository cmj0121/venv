.PHONY: all clean help

all: 		# build all sub-project

clean:		# clean-up environment

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'


.PHONY: apply delete
apply:		# deploy the MinIO
	kubectl apply -f deploy.yml

delete:		# remove the service
	kubectl delete -f deploy.yml
