#!/usr/bin/env bash

fail() {
  echo "unit tests failed"
  exit 1
}

# FILES=$(go list ./... | grep -v /vendor/) || fail
# go test -timeout 30s -short -v ${FILES} || fail

for file in $(find . -name "go.mod"); do
    dir=$(dirname "$file")
    cd "$dir"
    go test -timeout 30s -short -v ./... || fail
done
