bfile=$1
diff=$2
bval=$(<$bfile)
echo $(($bval+$diff)) > $bfile
