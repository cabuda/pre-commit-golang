#!/usr/bin/env bash

set -eu -o pipefail

FILES=$(go list ./...  | grep -v /vendor/)
exec go generate $FILES
