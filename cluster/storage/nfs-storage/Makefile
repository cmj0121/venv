# load the global config
include ../../Makefile.in

.PHONY: all clean help

all:		 # build all sub-project

clean: 		# clean-up environment

help:		# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'

.PHONY: apply delete test
apply: deploy.yml	# deploy the NFS StorageClass
	kubectl apply -f $<

delete: deploy.yml 	# remove the service
	kubectl delete -f test.yml || true
	kubectl delete -f deploy.yml

test:
	@kubectl apply -f test.yml > /dev/null
	@sleep 5
	@kubectl get pod test-pod -n nfs-test -o jsonpath="{.status.phase}"
	@kubectl delete -f test.yml > /dev/null

deploy.yml: deploy-env.yml
	sed "s#CLUSTER_NFS_SERVER#${CLUSTER_NFS_SERVER}#g; s#CLUSTER_NFS_EXPOSE_PATH#${CLUSTER_NFS_EXPOSE_PATH}#g" $< > $@
