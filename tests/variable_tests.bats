#!/usr/bin/env bats

source usr/lib/hacking-bash.sh

load '/usr/lib/bats-support/load.bash'
load '/usr/lib/bats-assert/load.bash'

DEBUG="true"

# is_defined

@test "is_defined nonexistant" {
    unset SOME_NONEXISTANT_VAR
    
    run is_defined SOME_NONEXISTANT_VAR
    
    assert_failure
}

@test "is_defined empty" {
    unset SOME_EMPTY_VAR
    SOME_EMPTY_VAR=""
    
    run is_defined SOME_EMPTY_VAR
    
    assert_success
}

@test "is_defined set" {
    unset SOME_SET_VAR
    SOME_SET_VAR="hello!"
    
    run is_defined SOME_SET_VAR

    assert_success
}

# is_undefined

@test "is_undefined nonexistant" {
    unset SOME_NONEXISTANT_VAR
    
    run is_undefined SOME_NONEXISTANT_VAR
    
    assert_success
}

@test "is_undefined empty" {
    unset SOME_EMPTY_VAR
    SOME_EMPTY_VAR=""
    
    run is_undefined SOME_EMPTY_VAR
    
    assert_failure
}

@test "is_undefined set" {
    unset SOME_SET_VAR
    SOME_SET_VAR="hello!"
    
    run is_undefined SOME_SET_VAR

    assert_failure
}

# is_defined_and_set

@test "is_defined_and_set nonexistant" {
    unset SOME_NONEXISTANT_VAR
    
    run is_defined_and_set SOME_NONEXISTANT_VAR
    
    assert_failure
}

@test "is_defined_and_set empty" {
    unset SOME_EMPTY_VAR
    SOME_EMPTY_VAR=""
    
    run is_defined_and_set SOME_EMPTY_VAR
    
    assert_failure
}

@test "is_defined_and_set set" {
    unset SOME_SET_VAR
    SOME_SET_VAR="hello!"
    
    run is_defined_and_set SOME_SET_VAR

    assert_success
}

# is_undefined_or_unset

@test "is_undefined_or_unset nonexistant" {
    unset SOME_NONEXISTANT_VAR
    
    run is_undefined_or_unset SOME_NONEXISTANT_VAR
    
    assert_success
}

@test "is_undefined_or_unset empty" {
    unset SOME_EMPTY_VAR
    SOME_EMPTY_VAR=""
    
    run is_undefined_or_unset SOME_EMPTY_VAR
    
    assert_success
}

@test "is_undefined_or_unset set" {
    unset SOME_SET_VAR
    SOME_SET_VAR="hello!"
    
    run is_undefined_or_unset SOME_SET_VAR

    assert_failure
}

# is_positive_integer

@test "is_positive_integer empty" {
    run is_positive_integer
    assert_failure
}

@test "is_positive_integer positive int" {
    run is_positive_integer 1234567890
    assert_success
}

@test "is_positive_integer negative int" {
    run is_positive_integer -1234567890
    assert_failure
}

@test "is_positive_integer invalid int 1" {
    run is_positive_integer 123a
    assert_failure
}

@test "is_positive_integer invalid int 2" {
    run is_positive_integer --123
    assert_failure
}

@test "is_positive_integer positive float" {
    run is_positive_integer 12345.6789
    assert_failure
}

# is_negative_integer

@test "is_negative_integer empty" {
    run is_negative_integer
    assert_failure
}

@test "is_negative_integer positive int" {
    run is_negative_integer 1234567890
    assert_failure
}

@test "is_negative_integer negative int" {
    run is_negative_integer -1234567890
    assert_success
}

@test "is_negative_integer invalid int 1" {
    run is_negative_integer 123a
    assert_failure
}

@test "is_negative_integer invalid int 2" {
    run is_negative_integer --123
    assert_failure
}

@test "is_negative_integer positive float" {
    run is_negative_integer 12345.6789
    assert_failure
}

# is_integer

@test "is_integer empty" {
    run is_integer
    assert_failure
}

@test "is_integer positive int" {
    run is_integer 1234567890
    assert_success
}

@test "is_integer negative int" {
    run is_integer -1234567890
    assert_success
}

@test "is_integer invalid int 1" {
    run is_integer 123a
    assert_failure
}

@test "is_integer invalid int 2" {
    run is_integer --123
    assert_failure
}

@test "is_integer positive float" {
    run is_integer 12345.6789
    assert_failure
}
