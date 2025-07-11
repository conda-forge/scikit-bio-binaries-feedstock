#!/bin/bash

echo "=== make all ==="
make all
if [ $? -ne 0 ]
then
  echo "ERROR: Build failed"
  exit 1
fi
echo "INFO: Build and install succeeded"

if [ "x${build_alias}" != "x" ]; then

if [ "x${build_alias}" == "x${host_alias}" ]; then
# only run the tests if not cross-compiling
# since they would fail to run due to invalid architecture

echo "=== Internal tests ==="
make test
if [ $? -ne 0 ]
then
  echo "ERROR: tests failed"
  exit 1
fi
echo "INFO: Tests succeeded"

fi # build_alias == host_alias

fi # build_alias exists
