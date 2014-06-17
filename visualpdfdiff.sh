if [ "a$#" != "a2" ];
then
	echo "Usage: $0 <left-pdf-file> <right-pdf-file>"
	exit -1
fi
function check_existence {
	if [ ! -f "$1" ];
	then
		echo "File $1 does not exist"
		exit -2
	fi
}
leftarg="$1"
rightarg="$2"
check_existence "$leftarg"
check_existence "$rightarg"

mkdir -p /tmp/visual-pdf-diff/
rm -f /tmp/visual-pdf-diff/*
convert -density 150x150 -fill red -opaque black +antialias $leftarg /tmp/visual-pdf-diff/back%02d.png
convert -density 150x150 -transparent white +antialias $rightarg /tmp/visual-pdf-diff/front%02d.png
ls /tmp/visual-pdf-diff/back*.png | while read backfile;
do
	n=$(echo "$backfile" | gawk -F'back' '{ print $2 }' | cut -d. -f1)
	if [ -f /tmp/visual-pdf-diff/front${n}.png -a -f /tmp/visual-pdf-diff/back${n}.png ];
	then
		composite /tmp/visual-pdf-diff/front${n}.png /tmp/visual-pdf-diff/back${n}.png /tmp/visual-pdf-diff/result${n}.png
	else
		echo "Can not find front${n}.png or back${n}.png"
		exit -3
	fi
done
convert /tmp/visual-pdf-diff/result*.png visual-pdf-diff-result.pdf

