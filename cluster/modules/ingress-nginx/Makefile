.PHONY: all clean help delete

all:   		# build all sub-project
	kubectl apply -f deploy.yml

clean: 		# clean-up environment

delete: 	# remove the service
	# just delete the namespace
	kubectl delete namespace ingress-nginx

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'
