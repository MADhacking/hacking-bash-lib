#!/bin/bash -u

source ../usr/lib/hacking-bash.sh

# Declare an indexed and an associative array
declare -a INDEXED_ARRAY EMPTY_INDEXED_ARRAY
declare -A ASSOCIATIVE_ARRAY EMPTY_ASSOCIATIVE_ARRAY

unset UNDEFINED_ARRAY

INDEXED_ARRAY[0]="zero"
INDEXED_ARRAY[1]="one"
INDEXED_ARRAY[2]="two"
INDEXED_ARRAY[5]="five"
INDEXED_ARRAY[6]="six"
INDEXED_ARRAY[8]="eight"

ASSOCIATIVE_ARRAY["zero"]="0"
ASSOCIATIVE_ARRAY["one"]="1"
ASSOCIATIVE_ARRAY["two"]="2"
ASSOCIATIVE_ARRAY["five"]="5"
ASSOCIATIVE_ARRAY["six"]="6"
ASSOCIATIVE_ARRAY["eight"]="8"


DEBUG="true"
#LOGGING=""

function test_run_echo_return
{
	MSG="\"${1}\" = "
	$(${1})
	MSG+="$?"
	echo "${MSG}"
}

function test_run_echo_output
{
	MSG="\"${1}\" = "
	OUTPUT="$(${1})"
	MSG+="\"${OUTPUT}\""
	echo "${MSG}"
}

debug_echo_array
debug_echo_array UNDEFINED_ARRAY
debug_echo_array EMPTY_INDEXED_ARRAY EMPTY_ASSOCIATIVE_ARRAY
debug_echo_array INDEXED_ARRAY
debug_echo_array ASSOCIATIVE_ARRAY

test_run_echo_output "get_next_array_index INDEXED_ARRAY"
test_run_echo_output "get_next_array_index INDEXED_ARRAY 0"
test_run_echo_output "get_next_array_index INDEXED_ARRAY 8"

test_run_echo_output "get_next_array_index EMPTY_INDEXED_ARRAY"
test_run_echo_output "get_next_array_index EMPTY_INDEXED_ARRAY 0"
