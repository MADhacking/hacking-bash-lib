#!/bin/bash -u

source ../usr/lib/hacking-bash.sh

DEBUG="true"
#LOGGING=""

function test_run_echo_return
{
	MSG="\"${1}\" = "
	$(${1}) && MSG+="true" || MSG+="false"
	echo "${MSG}"
}

unset SOME_NONEXISTANT_VAR
SOME_EMPTY_VAR=""
SOME_SET_VAR="hello!"

POSITIVE_INTEGER="1234567890"
NEGATIVE_INTEGER="-1234567890"
INVALID_INTEGER1="123a"
INVALID_INTEGER2="--123"
POSITIVE_FLOAT="12345.6789"
NEGATIVE_FLOAT="-12345.6789"
INVALID_FLOAT="123.a"

test_run_echo_return "is_defined   SOME_NONEXISTANT_VAR"
test_run_echo_return "is_defined   SOME_EMPTY_VAR"
test_run_echo_return "is_defined   SOME_SET_VAR"

test_run_echo_return "is_undefined SOME_NONEXISTANT_VAR"
test_run_echo_return "is_undefined SOME_EMPTY_VAR"
test_run_echo_return "is_undefined SOME_SET_VAR"

test_run_echo_return "is_defined_and_set    SOME_NONEXISTANT_VAR"
test_run_echo_return "is_defined_and_set    SOME_EMPTY_VAR"
test_run_echo_return "is_defined_and_set    SOME_SET_VAR"

test_run_echo_return "is_undefined_or_unset SOME_NONEXISTANT_VAR"
test_run_echo_return "is_undefined_or_unset SOME_EMPTY_VAR"
test_run_echo_return "is_undefined_or_unset SOME_SET_VAR"

test_run_echo_return "is_positive_integer"
test_run_echo_return "is_positive_integer ${POSITIVE_INTEGER}"
test_run_echo_return "is_positive_integer ${NEGATIVE_INTEGER}"
test_run_echo_return "is_positive_integer ${INVALID_INTEGER1}"
test_run_echo_return "is_positive_integer ${INVALID_INTEGER2}"
test_run_echo_return "is_positive_integer ${POSITIVE_FLOAT}"

test_run_echo_return "is_negative_integer"
test_run_echo_return "is_negative_integer ${POSITIVE_INTEGER}"
test_run_echo_return "is_negative_integer ${NEGATIVE_INTEGER}"
test_run_echo_return "is_negative_integer ${INVALID_INTEGER1}"
test_run_echo_return "is_negative_integer ${INVALID_INTEGER2}"
test_run_echo_return "is_negative_integer ${POSITIVE_FLOAT}"

test_run_echo_return "is_integer"
test_run_echo_return "is_integer ${POSITIVE_INTEGER}"
test_run_echo_return "is_integer ${NEGATIVE_INTEGER}"
test_run_echo_return "is_integer ${INVALID_INTEGER1}"
test_run_echo_return "is_integer ${INVALID_INTEGER2}"
test_run_echo_return "is_integer ${POSITIVE_FLOAT}"
