#!/usr/bin/env bash

pushd to_string
pub run test

pushd to_string_generator
pub run test

pushd example
pub run test
