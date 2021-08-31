.PHONY: all clean help

all:  		# build all sub-project

clean:		# clean-up environment

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'

.PHONY: apply delete test
apply:
	kubectl apply -f namespace.yml
	kubectl apply -f manifests/
	kubectl wait deployment/ingress-nginx-controller -n ingress-nginx --for=condition=Available --timeout=60s

delete:
	kubectl delete -f manifests/ --ignore-not-found=true
	kubectl delete -f namespace.yml
