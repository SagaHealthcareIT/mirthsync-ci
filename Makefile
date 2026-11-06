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

.PHONY: pull-local
pull-local:
	@MIRTHSYNC_PASSWORD="${DEV_PASS}" mirthsync.sh -s ${DEV_URL} -u ${DEV_USER} -t src --include-configuration-map -i -f pull

.PHONY: push-local
push-local:
	@MIRTHSYNC_PASSWORD="${DEV_PASS}" mirthsync.sh -s ${DEV_URL} -u ${DEV_USER} -t src --include-configuration-map -i -f push


.PHONY: push-remote
push-remote:
	@MIRTHSYNC_PASSWORD="${STAGE_PASS}" mirthsync.sh -s ${STAGE_URL} -u ${STAGE_USER} -t src --include-configuration-map -f --deploy-changed --deploy-new push

.PHONY: clean
clean:
	rm -rf src

.PHONY: clean-pull
clean-pull: clean pull-local

##-- Debug --##

# debug - display all environment variables
.PHONY: debug
debug:
	@echo "BRANCH:     $(BRANCH)"
# end
