#!/usr/bin/env bats

source usr/lib/hacking-bash.sh

load '/usr/lib/bats-support/load.bash'
load '/usr/lib/bats-assert/load.bash'

DEBUG=true

# debug_echo_array

@test "debug_echo_array empty" {
	run debug_echo_array
	assert_output "debug: debug_echo_array() called with no parameters"
}

@test "debug_echo_array undefined" {
    unset UNDEFINED_ARRAY
    
    run debug_echo_array "UNDEFINED_ARRAY"
    
    assert_output "debug: UNDEFINED_ARRAY={}"
}

@test "debug_echo_array empty indexed" {
    unset INDEXED_ARRAY
    declare -a INDEXED_ARRAY
    
    run debug_echo_array "EMPTY_INDEXED_ARRAY"
    
    assert_output "debug: EMPTY_INDEXED_ARRAY={}"
}

@test "debug_echo_array empty associative" {
    unset EMPTY_ASSOCIATIVE_ARRAY
    declare -A EMPTY_ASSOCIATIVE_ARRAY
    
    run debug_echo_array "EMPTY_ASSOCIATIVE_ARRAY"
    
    assert_output "debug: EMPTY_ASSOCIATIVE_ARRAY={}"
}

@test "debug_echo_array indexed" {
    unset INDEXED_ARRAY
    declare -a INDEXED_ARRAY
    
    INDEXED_ARRAY[0]="zero"
    INDEXED_ARRAY[1]="one"
    INDEXED_ARRAY[2]="two"
    INDEXED_ARRAY[5]="five"
    INDEXED_ARRAY[6]="six"
    INDEXED_ARRAY[8]="eight"
    
    run debug_echo_array INDEXED_ARRAY
    
    assert_output 'debug: INDEXED_ARRAY={[0]="zero", [1]="one", [2]="two", [5]="five", [6]="six", [8]="eight"}'
}

@test "debug_echo_array associative" {
    unset ASSOCIATIVE_ARRAY
    declare -A ASSOCIATIVE_ARRAY
    
    ASSOCIATIVE_ARRAY["zero"]="0"
    ASSOCIATIVE_ARRAY["one"]="1"
    ASSOCIATIVE_ARRAY["two"]="2"
    ASSOCIATIVE_ARRAY["five"]="5"
    ASSOCIATIVE_ARRAY["six"]="6"
    ASSOCIATIVE_ARRAY["eight"]="8"
    
    run debug_echo_array ASSOCIATIVE_ARRAY
    
    assert_output 'debug: ASSOCIATIVE_ARRAY={[five]="5", [two]="2", [eight]="8", [one]="1", [zero]="0", [six]="6"}'
}

# get_next_array_index

@test "get_next_array_index indexed no start" {
    unset INDEXED_ARRAY
    declare -a INDEXED_ARRAY
    
    INDEXED_ARRAY[0]="zero"
    INDEXED_ARRAY[1]="one"
    INDEXED_ARRAY[2]="two"
    INDEXED_ARRAY[5]="five"
    INDEXED_ARRAY[6]="six"
    INDEXED_ARRAY[8]="eight"
    
    run get_next_array_index INDEXED_ARRAY
    
    assert_output "0"
}

@test "get_next_array_index indexed zero start" {
    unset INDEXED_ARRAY
    declare -a INDEXED_ARRAY
    
    INDEXED_ARRAY[0]="zero"
    INDEXED_ARRAY[1]="one"
    INDEXED_ARRAY[2]="two"
    INDEXED_ARRAY[5]="five"
    INDEXED_ARRAY[6]="six"
    INDEXED_ARRAY[8]="eight"
    
    run get_next_array_index INDEXED_ARRAY 0
    
    assert_output "1"
}

@test "get_next_array_index indexed gap" {
    unset INDEXED_ARRAY
    declare -a INDEXED_ARRAY
    
    INDEXED_ARRAY[0]="zero"
    INDEXED_ARRAY[1]="one"
    INDEXED_ARRAY[2]="two"
    INDEXED_ARRAY[5]="five"
    INDEXED_ARRAY[6]="six"
    INDEXED_ARRAY[8]="eight"
    
    run get_next_array_index INDEXED_ARRAY 2
    
    assert_output "5"
}

@test "get_next_array_index indexed end" {
    unset INDEXED_ARRAY
    declare -a INDEXED_ARRAY
    
    INDEXED_ARRAY[0]="zero"
    INDEXED_ARRAY[1]="one"
    INDEXED_ARRAY[2]="two"
    INDEXED_ARRAY[5]="five"
    INDEXED_ARRAY[6]="six"
    INDEXED_ARRAY[8]="eight"
    
    run get_next_array_index INDEXED_ARRAY 8
    
    assert_output ""
}

@test "get_next_array_index empty indexed no start" {
    unset INDEXED_ARRAY
    declare -a INDEXED_ARRAY
    
    run get_next_array_index EMPTY_INDEXED_ARRAY
    
    assert_output ""
}

@test "get_next_array_index empty indexed zero start" {
    unset INDEXED_ARRAY
    declare -a INDEXED_ARRAY
    
    run get_next_array_index EMPTY_INDEXED_ARRAY 0
    
    assert_output ""
}

