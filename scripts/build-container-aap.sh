#!/bin/bash

# Version
OLS_VERSION=v0.0.0
OLS_API_IMAGE='quay.io/ttakamiy/lightspeed-service-api:latest'

# To build container for local use
if [ -z "$OLS_NO_IMAGE_CACHE" ]; then
  podman build --no-cache --build-arg=VERSION="${OLS_VERSION}" -t "${OLS_API_IMAGE:-quay.io/openshift-lightspeed/lightspeed-service-api:latest}" -f Containerfile-aap
else
  podman build --build-arg=VERSION=${OLS_VERSION} -t "${OLS_API_IMAGE:-quay.io/openshift-lightspeed/lightspeed-service-api:latest}" -f Containerfile-aap
fi

# To test-run for local development
# podman run --rm -ti -p 8080:8080 ${OLS_API_IMAGE:-quay.io/openshift-lightspeed/lightspeed-service-api:latest}
