#!/usr/bin/env bats

source usr/lib/hacking-bash.sh

load '/usr/lib/bats-support/load.bash'
load '/usr/lib/bats-assert/load.bash'

DEBUG=true

# copy_function

@test "copy_function no params" {
    run copy_function
    
    assert_failure
    assert_output "ERROR: copy_function() called with insufficient function names"
}

@test "copy_function one param" {
    run copy_function "one"
    
    assert_failure
    assert_output "ERROR: copy_function() called with insufficient function names"
}

@test "copy_function non-existent source" {
    run copy_function "this_func_doesnt_exist" "some_new_name"
    
    assert_failure
    assert_output "ERROR: copy_function() called with non-existent source function name [this_func_doesnt_exist]"
}

@test "copy_function existing destination" {
    run copy_function "debug_echo" "error_echo"
    
    assert_failure
    assert_output "ERROR: copy_function() called with existent destination function name [error_echo]"
}

@test "copy_function" {
    
    function copy_func_test()
    {
        copy_function "debug_echo" "debug_echo_two" || return 1
        debug_echo_two || return 1
        return 0
    }
    
    run copy_func_test
    assert_success
}

# delete_function

@test "delete_function no params" {
    run delete_function
    
    assert_failure
    assert_output "ERROR: delete_function() called with no function name"
}

@test "delete_function non-existent source" {
    run delete_function "this_func_doesnt_exist"
    
    assert_failure
    assert_output "ERROR: delete_function() called with non-existent source function name [this_func_doesnt_exist]"
}

@test "delete_function" {
    
    function delete_func_test()
    {
        delete_function "debug_echo" || return 1
        is_function_defined "debug_echo" && return 1
        return 0
    }
    
    run delete_func_test
    assert_success
}

# rename_function

@test "rename_function no params" {
    run rename_function
    
    assert_failure
    assert_output "ERROR: rename_function() called with insufficient function names"
}

@test "rename_function one param" {
    run rename_function "one"
    
    assert_failure
    assert_output "ERROR: rename_function() called with insufficient function names"
}

@test "rename_function non-existent source" {
    run rename_function "this_func_doesnt_exist" "some_new_name"
    
    assert_failure
    assert_output "ERROR: rename_function() called with non-existent source function name [this_func_doesnt_exist]"
}

@test "rename_function existing destination" {
    run rename_function "debug_echo" "error_echo"
    
    assert_failure
    assert_output "ERROR: rename_function() called with existent destination function name [error_echo]"
}

@test "rename_function" {
    
    function rename_func_test()
    {
        rename_function "debug_echo" "debug_splodge" || return 1
        is_function_defined "debug_echo" && return 1
        is_function_defined "debug_splodge" || return 1
        return 0
    }
    
    run rename_func_test
    assert_success
}

# debug_function_calls

function factorial()
{
    if [[ $1 -le 1 ]]
    then
        echo 1
    else
        last=$(factorial $(($1-1)))
        echo $(($1 * last))
    fi
}

@test "debug_function_calls" {

    function debug_func_test
    {
        debug_function_calls factorial
        factorial 3    
    }

    run debug_func_test

    assert_success
    assert_line --index 0 "debug: function factorial 3"
    assert_line --index 1 "debug: {"
    assert_line --index 2 "debug:    function factorial 2"
    assert_line --index 3 "debug:    {"
    assert_line --index 4 "debug:        function factorial 1"
    assert_line --index 5 "debug:        {"
    assert_line --index 6 "debug:        } "
    assert_line --index 7 "debug:    } "
    assert_line --index 8 "6"
    assert_line --index 9 "debug: } "
}

