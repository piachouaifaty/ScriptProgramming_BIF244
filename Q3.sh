

awk 'BEGIN {FS="\t"; OFS="\t"} { print $2, $1, $3, $4 }' names.txt > switchedNames.txt

#Value to match on: (\d{1,2})/(\d{1,2})/(\d{4})  
#Replacement value: \2-\1-\3

sed -i 's/\((\d{1,2})/(\d{1,2})/(\d{4})\)|\3-\2-\4/g' switchedNames.txt

#^[0-9]{4} for the first 4 digits of the id

awk 'BEGIN {FS="\t"; OFS="\t"} { print $4 }' switchedNames.txt | grep -E ^[0-9]{4} > years.txt

cat years.txt | while read line \
do
   line=$line+3
done \ > years.txt

echo "Graduation year" | header.txt

#year=$year+3
paste switchedNames.txt years.txt > switchedNames.txt #combines by column




