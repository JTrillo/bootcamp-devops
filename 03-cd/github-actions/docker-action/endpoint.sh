#!/bin/sh -l

echo "Hello $INPUT_WHOTOGREET"
time=$(date)
echo "::set-output name=time::$time"