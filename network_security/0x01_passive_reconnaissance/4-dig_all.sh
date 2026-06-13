#!/bin/bash
dig ANY $1 +noall +answer | tr '\t' ' '
