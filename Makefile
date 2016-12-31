# Simple Makefile for clearing the cache on Cloudflare. Requires two environment variables
# to be set, namely:
#
#   CLOUDFLARE_API_KEY
#   CLOUDFLARE_EMAIL
#
# The user will require permissions for clearing the cache. The Makefile also takes an
# argument for the Zone to be cleared. This is set to the default for this project but
# can be overridden using
#
#   ZONE=example.com make clear-cache
#
# You will also need curl and jq installed locally for the commands to run successfully.
ZONE?=morethanseven.net

ZONE_ID:=$(shell curl --silent -X GET "https://api.cloudflare.com/client/v4/zones?name=$(ZONE)&status=active&page=1&per_page=20&order=status&direction=desc&match=all" \
	-H "X-Auth-Email:${CLOUDFLARE_EMAIL}" \
	-H "X-Auth-Key:${CLOUDFLARE_API_KEY}" \
	-H "Content-Type: application/json" | jq ".result[0].id")

all: clear-cache

zone-id:
	@echo $(ZONE_ID)

clear-cache:
	@curl --silent -X DELETE "https://api.cloudflare.com/client/v4/zones/$(ZONE_ID)/purge_cache" \
		-H "Content-Type:application/json" \
		-H "X-Auth-Key:${CLOUDFLARE_API_KEY}" \
		-H "X-Auth-Email:${CLOUDFLARE_EMAIL}" \
	--data '{"purge_everything":true}' | jq

.PHONY: all clear-cache zone-id
