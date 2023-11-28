#!/bin/bash

if [ ! -f "config.sh" ]; then
    echo "config.sh is missing; use config.sh.dist as a base"
    exit 1;
fi

source config.sh

if [[ "$2" == "" ]]; then
    echo "usage: $0 <lang> <problem_id>"
    echo "  <lang> = python|cpp"
    echo "  <problem_id> = problem identifier"
    exit 1;
fi

LANG="$1"
PROBLEM_ID="$2"
TARGET_DIR="dist"

if [[ "$LANG" == "python" ]]; then
    COMPILER_ID="116"
    COMPILER_VERSION_ID="7"
elif [[ "$LANG" == "cpp" ]]; then
    COMPILER_ID="1"
    COMPILER_VERSION_ID="7"
else
    echo "[error] language $LANG not supported"
    exit 1;
fi

./create_archive.sh "$LANG" "$TARGET_DIR"

curl \
    -X POST \
    -F "problemId=$PROBLEM_ID" \
    -F "compilerId=$COMPILER_ID" \
    -F "compilerVersionId=$COMPILER_VERSION_ID" \
    -F "source=@$TARGET_DIR/source.tar.gz" \
    "https://$SE_ENDPOINT_HASH.problems.sphere-engine.com/api/v4/submissions?access_token=$SE_ACCESS_TOKEN"
