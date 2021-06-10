#!/bin/bash

read N

ROWS=63
COLM=100
MAX_N=5

POWR=$(( MAX_N-N ))
BLANK_LNS=$(( 2**(POWR+1)-1 ))


print_blank () {
    local BLANK_LNS=$BLANK_LNS
    while [[ $BLANK_LNS>0 ]]
    do
        COLMI=100
        while [[ $COLMI>0 ]]
        do
        printf "_"
        (( COLMI-- ))
        done 
    (( BLANK_LNS-- ))
    printf "\n"
    done
    
}

print_tree () {
    POWR=$(( MAX_N-N ))
    ROOTS=$(( 2**N ))
    LEFT_SPC=$(( 17+2**POWR ))
    RGHT_SPC=$(( 18+2**POWR ))
    ROOT_SPC=$(( 2**(POWR+1)-1 ))
    ROOT_SPCB=$(( 2**(POWR+1)-1 ))
    
    while [[ $ROOT_SPC>0 ]]
    do
        for((i=1;i<=$LEFT_SPC;i++)); do printf "_"; done
        for((i=1;i<=($ROOTS/2);i++))
        do
            printf "1"
            for((j=1;j<=ROOT_SPC;j++)); do printf "_"; done
            printf "1"
            if [[ $i -eq $(( ROOTS/2 )) ]]
            then
                for((j=1;j<=RGHT_SPC;j++)); do printf "_"; done
            else
                for((j=1;j<=ROOT_SPCB;j++)); do printf "_"; done
            fi
            
        done
        printf "\n"
        (( LEFT_SPC++ ))
        (( RGHT_SPC++ ))
        if [[ $ROOT_SPC -eq 1 ]]
        then
            ROOT_SPC=$(( ROOT_SPC-1 ))
        else
            ROOT_SPC=$(( ROOT_SPC-2 ))
        fi
        ROOT_SPCB=$(( ROOT_SPCB+2 )) 
    done
    
    NLINES=$(( 2**POWR ))
        
    while [[ $NLINES>0 ]]
    do
        for((i=1;i<=$LEFT_SPC;i++)); do printf "_"; done
        for((i=1;i<=($ROOTS/2);i++))
        do
            printf "1"
            if [[ $i -eq $(( ROOTS/2 )) ]]
            then
                for((j=1;j<=RGHT_SPC;j++)); do printf "_"; done
            else
                for((j=1;j<=ROOT_SPCB;j++)); do printf "_"; done
            fi
            
        done
        printf "\n"
        (( NLINES-- ))
    done
    
    }

print_blank

while [[ $N>0 ]]
do
    print_tree
    (( N-- ))
done
