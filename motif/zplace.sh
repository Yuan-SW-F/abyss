#!/bin/bash
# File Name: zplace.sh
# Author  : fuyuan, 907569282@qq.com
# Created Time: 2020-03-12 00:29:38
source ~/.bashrc

A=6
B=8
for i in `ls *fa`;do
	sh zzz.sh $i | perl -ne '/\S+\s+\S+\s+(\S+)/;next if length($1) < 4;/(\S+)$/;next if $1 < 2;print ' | sort -k 6 -nr > $i.place
	#perl rich_place.pl $i.place 4 4 > $i.place.zc44
	perl rich_place.pl $i.place $A $B > $i.place.zc$A$B
#	grep . *zc | awk ''
done
grep . *zc$A$B | awk '{if ($3>=2){print}}' | sed s/___/\ / | awk '{print $2}' | sort | uniq > motif$A$B.list
grep -f motif$A$B.list *zc$A$B | perl -ne 'print "$1\t$2\t$3\n" if /(\w+)\S+___(\S+)+\s+\S+\s+(\S+)/' | less > motif$A$B.list.xls
#grep . *zc | awk '{if ($3>=2){print}}' | perl -ne 'chomp; /\:(\S+)/;$s=$1; $n=`grep -P "\ $s" zplace`;s/.bed.fa.place.zc:/\t/; $m=$_;for (split /\n/,$n){print "$m\t$_\n";}'

#grep . *zc | awk '{if ($3>=3){print}}'
#cp zzz.sh zplace.sh zplace rich_place.pl 
