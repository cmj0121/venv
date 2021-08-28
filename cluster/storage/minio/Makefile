include ../../Makefile.in

.PHONY: all clean help delete deploy test

all: deploy	# build all sub-project

clean:		# clean-up environment

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'

deploy: deploy.yml	# deploy the MinIO
	kubectl apply -f $<

delete: deploy.yml	# remove the service
	kubectl delete -f $<
