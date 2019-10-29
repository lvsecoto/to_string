#!/usr/bin/env bash

pushd to_string_generator
echo 'pub run test'
pub run test || EXIT_CODE=$?
popd

pushd example
echo 'pub run test'
pub run test || EXIT_CODE=$?
popd

exit ${EXIT_CODE}
