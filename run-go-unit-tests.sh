#!/usr/bin/env bash

fail() {
  echo "unit tests failed"
  exit 1
}

# 步骤 1：获取包含 _test.go 文件的目录列表
directories=$(find . -type f -name '*_test.go' -exec dirname {} \; | sort -u)

# 遍历每个子目录并执行命令
for dir in $directories; do
	echo -e "\e[31mExecuting command in directory: $dir\e[0m"
	cd "$dir" || exit

	go test -timeout 30s -short -v || fail

	cd - >/dev/null || exit
	echo -e "\n"
done
