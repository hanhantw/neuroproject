# Usage: ./ckip.sh input_dir output_dir

if [ -d "$1" ]; then # Check if $1 (input dir) exists.
	rm -rf $2 
	mkdir $2 # output dir
	for filename in $1/*; do	
		fname=`basename $filename`
		echo $fname
		ruby bracket.rb $filename tmp.txt~
		ruby punc.rb tmp.txt~ $2/$fname
	done
	rm tmp.txt~
else
	echo "Sorry, the directory '$1' doesn't exist."
fi
