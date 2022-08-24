#!/bin/sh

. "${0%/*}/build_shared_vars.sh"


CLANG_A11=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r353983c/bin/
CLANG_A12=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r416183b/bin/
CLANG_A13=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r450784d/bin/

if  [ -d "$CLANG_A13" ]; then
    echo "Using Clang (build r450784d) from Android 13."
    export CLANG=$CLANG_A13
elif  [ -d "$CLANG_A12" ]; then
    echo "Using Clang (build r416183b) from Android 12."
    export CLANG=$CLANG_A12
elif [ -d "$CLANG_A11" ]; then
    echo "Using Clang (build r353983) from Android 11."
    export CLANG=$CLANG_A11
fi

# Cross Compiler
CC="clang"

# Build command
BUILD_ARGS="LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld CLANG_TRIPLE=aarch64-linux-gnu"

PATH=$CLANG:$PATH
# source shared parts
. "${0%/*}/build_shared.sh"
