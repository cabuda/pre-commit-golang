#!/usr/bin/env bash

fail() {
  echo "unit tests failed"
  exit 1
}

# 查找所有包含go.mod的子目录
directories=$(find . -name "go.mod" -exec dirname {} \;)

# 遍历每个子目录并执行命令
for dir in $directories; do
	echo -e "\e[31mExecuting command in directory: $dir\e[0m"
	cd "$dir" || exit

	go test -timeout 30s -short -v ./... || fail

	cd - >/dev/null || exit
	echo -e "\n"
done
