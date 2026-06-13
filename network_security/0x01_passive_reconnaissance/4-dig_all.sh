#!/bin/bash
dig $1 A $1 NS $1 SOA $1 MX $1 TXT +noall +answer
