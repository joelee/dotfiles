#!/usr/bin/env bash

PASSWD="$(pass $1 2>/dev/null)"

if [[ -n "$PASSWD" ]]; then
  echo "$PASSWD"
elif [[ -n "$2" ]]; then
  echo "$2"
else
  echo "No Secret found for $1"
fi

