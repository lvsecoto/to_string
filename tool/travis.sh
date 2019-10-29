#!/usr/bin/env bash

pushd to_string_generator
echo 'pub get'
pub get || exit $?
echo 'pub run test'
pub run test || exit $?
popd

pushd example
echo 'pub get'
pub get || exit $?
echo 'pub run test'
pub run test || exit $?
popd
