##
# Mirthsync CI/CD samples
##

##-- Environment Variables --#


# Get current branch and transform '/' to '-'
BRANCH := $(or $(CI_COMMIT_REF_NAME), `git rev-parse --abbrev-ref HEAD`)
BRANCH := $(shell echo $(BRANCH) | tr / -)

# Retrieve first 7 characters of current commit hash
SHORT_HASH := `git rev-parse --short HEAD`

##-- Main Makefile Targets --##

.PHONY: pull
pull:
	mirthsync.sh --help

.PHONY: push
push:
	mirthsync.sh --help

##-- Debug --##

# debug - display all environment variables
.PHONY: debug
debug:
	@echo "BRANCH:     $(BRANCH)"

# end
