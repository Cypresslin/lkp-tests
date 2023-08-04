#!/bin/bash

# As of now, make bpf failed when we use clang under v10.
# prepare_for_llvm works for cluster, for local user, please install clang v10
# mannually.
prepare_for_llvm()
{
	#   LLVM version 11.0.1
	# Ubuntu LLVM version 14.0.0
	local llvm_version=$(llc --version | grep "LLVM version")
	llvm_version=${llvm_version##* }
	llvm_version=${llvm_version%%.*}
	echo "llvm_version: $llvm_version"
	[[ $llvm_version -lt 10 ]] && {
		echo "Please install llvm-10 before running bpf"
		return 1
	}
}
