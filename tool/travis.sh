#!/usr/bin/env bash

pushd to_string_generator
pub run test
popd

pushd example
pub run test
popd
