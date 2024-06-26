#!/bin/bash

source "$(dirname "${BASH_SOURCE}")/lib/init.sh"

VERIFY_DIR=$(mktemp -d -t featuregates-verify-XXXXXX)

go run --mod=vendor -trimpath github.com/openshift/api/payload-command/cmd/write-available-featuresets --asset-output-dir="${VERIFY_DIR}"

diff -r "${VERIFY_DIR}" ./payload-manifests/featuregates

rm -rf "${VERIFY_DIR}"
