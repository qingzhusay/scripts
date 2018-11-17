#!/bin/env bash

set -e

find ./sqli-labs -type f -iname "*.php" -print0 | xargs -0 perl -pi \
  -e 's/mysql_connect/mysqli_connect/g; ' \
  -e 's/mysql_query\(/mysqli_query\(\$con, /g;' \
  -e 's/mysql_error\(/mysqli_error\(\$con/g;' \
  -e 's/mysql_real_escape_string\(/mysqli_real_escape_string\(\$con, /g;' \
  -e 's/mysql_fetch_array\(\$result\)/mysqli_fetch_array\(\$result, MYSQLI_BOTH\)/g;' \
  -e 's/mysql_fetch_array\(\$result1\)/mysqli_fetch_array\(\$result1, MYSQLI_BOTH\)/g;' \
  -e 's/mysql_select_db\(\$dbname,\$con\)/mysqli_select_db\(\$con, \$dbname\)/g;'

