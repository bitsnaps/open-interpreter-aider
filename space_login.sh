#!/usr/bin/expect

set timeout -1
spawn space login

expect "Enter access token (0 chars) >"
send "$env(DETA_PROJECT_KEY)\r"

expect eof
