#!/bin/bash -xv
# SPDX-FileCopyrightText: 2026 TSUKADA HAYATO
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が異なる"
    res=1
}

res=0

#正常
out=$(echo "4x+1y=7,1x+3y=10" | ./equation)
[ "$?" = 0 ] || ng "$LINENO"
expected=$(printf "1.000000\n3.000000")
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(echo "3x + y = 5, x - 2y = -3" | ./equation)
[ "$?" = 0 ] || ng "$LINENO"
expected=$(printf "1.000000\n2.000000")
[ "${out}" = "${expected}" ] || ng "$LINENO"

#エラー
out=$(echo "" | ./equation 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "4x+1y=7" | ./equation 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "ax+by=c,dx+ey=f" | ./equation 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "0x+2y=4,3x+1y=5" | ./equation 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "1x+4y=7,4x+1y=10" | ./equation 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo "OK"
exit $res