#!/bin/bash

#Cleaning release year data format to (year), omitted the end year data or the quarter information
#First sed is to match the line with year data, then replace year strings to only the one before en dash (or after if there is nothing before it). Then delete unnecessary characters like en dash and quarter, also delete parenthesis to maintain formatting. Finally output to new file

sed -E 's/\(([0-9]{4})–([0-9]{4})\)|\(([0-9]{4})-|\(-([0-9]{4})\)/(\1)/g' $1 |
sed -E 's/[()]|[-–]|[-–] //g' > cleaning_output.csv 

#print out the label line first as we will need to skip the first line for the next step
head -1 cleaning_output.csv > cleaned_output.csv 

awk -F, -v RS='\r\n' -v OFS="," '
BEGIN{
}
NR>1{ 
  #If there is Roman number before year, delete it
  if ($2 ~ /^[IVXLCDM]+ [0-9]{4}/) {
    new=$2 
    gsub(/[IVXLCDM]+ /,"",new)
    $2=new 
  }
  #If there is only Roman number (quarter data), delete it
  else if ($2 ~ /^[IVXLCDM]+/) {
    new=$2
    gsub(/^[IVXLCDM]+/, "", new)
    $2=new
  }
  print $0
}' cleaning_output.csv >> cleaned_output.csv

#Replace the space between Year and genre with comma
sed -E 's/([0-9]{4}) ([a-zA-Z])/\1,\2/g' cleaned_output.csv > final_movies.csv     
