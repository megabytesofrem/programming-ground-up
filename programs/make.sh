#!/bin/bash
set -x

clean() {
    rm *.o
}

build() {
    as $1.s -o $1.o
    ld $1.o -o $1
}

$@