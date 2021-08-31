.PHONY: all clean help

all:  		# build all sub-project

clean:		# clean-up environment

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'

.PHONY: apply delete
apply:
	kubectl apply -f manifests/
	# dump the token
	# kubectl -n kubernetes-dashboard describe secret admin-user-token | grep '^token'

delete:
	kubectl delete -f manifests/ --ignore-not-found=true

port-forward:
	# you can change to another service
	kubectl port-forward -n kubernetes-dashboard svc/kubernetes-dashboard 1443:443
