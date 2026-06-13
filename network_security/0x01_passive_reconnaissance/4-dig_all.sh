#!/bin/bash
dig $1 ANY +noall +answer | sed '/^$/d'
