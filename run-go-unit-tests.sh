#!/usr/bin/env bash

fail() {
  echo "unit tests failed"
  exit 1
}

# FILES=$(go list ./... | grep -v /vendor/) || fail
# go test -timeout 30s -short -v ${FILES} || fail

find . -name go.mod -execdir sh -c 'go test -timeout 30s -short -v ./... || fail' \;
