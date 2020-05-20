#!/bin/sh

for d in ./*/ ; do 
		  	g=$(cd "$d" && wc -l log.txt | awk '{print $1}')
			if [ $g -gt 25 ]
			then
				(cd "$d" && awk 'FNR==26 {print $2}' log.txt) >>  output.txt
			else
				echo "No result" >> output.txt
			fi
		done



for d in */; do echo $d >> dir.txt ; done

paste dir.txt output.txt | awk -F'\t' '{ printf("%-1s %s\n" , $1, $2) }' >> result.txt ; done

sort -g -t ' ' -k 2 result.txt > sorted.txt



