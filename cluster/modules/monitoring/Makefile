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
	kubectl apply -f namespace.yml
	kubectl apply -f prometheus/
	kubectl apply -f node-exporter/
	kubectl apply -f kube-state-metrics/
	kubectl apply -f grafana/

delete:
	kubectl delete -f grafana/            --ignore-not-found=true
	kubectl delete -f kube-state-metrics/ --ignore-not-found=true
	kubectl delete -f node-exporter/      --ignore-not-found=true
	kubectl delete -f prometheus/         --ignore-not-found=true
	kubectl delete -f namespace.yml       --ignore-not-found=true

port-forward:
	# you can change to another service
	# kubectl port-forward -n monitoring svc/prometheus         9090:9090
	# kubectl port-forward -n monitoring svc/grafana            3000:3000
	# kubectl port-forward -n monitoring svc/node-exporter      9100:9100
	# kubectl port-forward -n monitoring svc/kube-state-metrics 8080:8080
