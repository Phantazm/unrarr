#!/usr/bin/env bash
#
# NAME
#        test.sh - Test script
#
# BUGS
#        https://github.com/l0b0/unrarr/issues
#
# COPYRIGHT AND LICENSE
#        Copyright (C) 2012 Victor Engmark
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        (at your option) any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

declare -r cmd="$(dirname -- "$0")/$(basename -- "$(dirname -- "$0")").sh"
declare -r test_name=$'--$`!*@\a\b\E\f\r\t\v\\\'"\360\240\202\211 \n'

oneTimeSetUp() {
    test_dir="$__shunit_tmpDir/$test_name"
}

setUp() {
    mkdir -- "$test_dir"
    assertEquals 'Exit code' 0 $?
}

tearDown() {
    rm -r -- "$test_dir"
}

test_simple() {
    file_name="$test_dir"/"$test_name".rar
    rar a "$file_name" "$cmd"
    "$cmd"
}

test_verbose() {
    fail 'todo'
}

test_delete() {
    fail 'todo'
}

test_delete_multipart_archives() {
    fail 'todo'
}

# load and run shUnit2
test -n "${ZSH_VERSION:-}" && SHUNIT_PARENT=$0
. /usr/share/shunit2/shunit2
