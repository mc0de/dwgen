#!/bin/bash

wordlist='diceware.wordlist.asc'

function genword()
{
    word=$(grep $(shuf -z -r -i1-6 -n5) $wordlist | cut -f2)
}

function test() {
    i=$1
    while [[ $i -gt 0 ]]; do
        echo $(shuf -z -r -i1-6 -n5) >> output
    done
}

function genpass()
{
    i=$1
    while [[ $i -gt 0 ]]; do
        genword
        pass="$pass$word"
        readable="$readable $word"
        i=$((i-1))
    done
    echo
    echo $readable
    echo $pass
    echo
}

genpass 6
