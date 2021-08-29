.PHONY: all clean help

all: 		# build all sub-project

clean: 		# clean-up environment

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'


.PHONY: apply delete
apply:
	kubectl apply -f deploy.yml
	@kubectl wait \
		--namespace ingress-nginx \
		--for=condition=ready pod \
		--selector=app.kubernetes.io/component=controller \
		--timeout=600s

delete: 	# remove the service
	# just delete the namespace
	kubectl delete namespace ingress-nginx
