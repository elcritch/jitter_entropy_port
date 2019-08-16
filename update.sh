#!/bin/sh

# update
git submodule update --init --recursive

rm -Rf src/
cp -Rv jitter*/ src/
cp -Rv jitterentropy-rngd/* src/
rm -Rf src/.git

# sed -i.bak 's/.*DESTDIR :=.*/DESTDIR := ..\/priv\//' src/Makefile
# OBJS := $(addprefix $(MIX_APP_PATH)/obj, $(C_OBJS))
rm src/Makefile.bak
