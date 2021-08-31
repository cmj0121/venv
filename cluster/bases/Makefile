SUBDIR := nfs-storage ingress-nginx
.PHONY: all clean help $(SUBDIR)

all: $(SUBDIR) 		# build all sub-project

clean: $(SUBDIR)	# clean-up environment

help:				# show this message
	@printf "Usage: make [OPTION]\n"
	@printf "\n"
	@perl -nle 'print $$& if m{^[\w-]+:.*?#.*$$}' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?#"} {printf "    %-18s %s\n", $$1, $$2}'

$(SUBDIR):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: apply delete
apply delete: $(SUBDIR)
