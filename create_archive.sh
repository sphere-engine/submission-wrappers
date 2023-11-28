#!/bin/bash

LANG="$1"
TARGET_DIR="$2"

tar -czf $TARGET_DIR/$LANG.tar.gz -C langs/$LANG .
