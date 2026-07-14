#!/bin/bash
#
# DIY Part 2: Rust LLVM fix + build date in firmware filename
#
set -x

# Fix Rust compilation (disable download-ci-llvm)
sed -i 's/ci-llvm=true/ci-llvm=false/g' feeds/packages/lang/rust/Makefile

# Add build date to firmware filename
sed -i -e '/^IMG_PREFIX:=/i BUILD_DATE := $(shell date +%Y%m%d)' \
       -e '/^IMG_PREFIX:=/ s/\($(SUBTARGET)\)/\1-$(BUILD_DATE)/' include/image.mk
