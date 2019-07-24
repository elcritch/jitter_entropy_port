#!/bin/sh

# update
git submodule update --init --recursive

rm -Rf src/
cp -Rv jitter*/ src/
cp -Rv jitterentropy-rngd/* src/
rm -Rf src/.git

