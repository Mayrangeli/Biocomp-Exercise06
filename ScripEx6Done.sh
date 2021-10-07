#Scrip makes a file of the unique gender-yearsExperience combinations
cat wages.csv| tail -3294| cut -d "," -f 1,2 | tr "," " " | sort -u | sort -t " "  -k1,1 -k2,2n| cat > gender_yearsExperience_combinations.txt
 
#Scrip returns
#1) the gender, yearsExperience, and wage for the highest earner
#2) the gender, yearsExperience, and wage for the lowest earner
#3) the number of females in the top ten earners in this data set

V1=$(cat wages.csv| tail -3294 | cut -d "," -f 1,2,4 | tr "," " "| sort -t " " -k3,3n| tail -1)
V2=$(cat wages.csv| tail -3294 | cut -d "," -f 1,2,4 | tr "," " "| sort -t " " -k3,3n| head -1)
V3=$(cat wages.csv| tail -3294 | cut -d "," -f 1,2,4 | tr "," " "| sort -t " " -k3,3nr| head -10| egrep "female"| wc -l)

echo "highest earner $V1"
echo "lowest earner $V2"
echo "top ten females $V3"

#Code will return the vhange in the wages earn depending on the years of school 12 vs 16
#1) Min wages 12
#2) Min wages 16
#3) Wage gap by doing a substracting of 12 vs 16

V1=$(cat wages.csv| tail -3294| cut -d "," -f 3,4 |  tr "," " "| egrep "^16" | sort -t " " -k2,2rn| tail -1| cut -d " " -f 2)
V2=$(cat wages.csv| tail -3294| cut -d "," -f 3,4 |  tr "," " "| egrep "^12" | sort -t " " -k2,2rn| tail -1| cut -d " " -f 2)
V3=$(echo "$V1-$V2" | bc)
echo "Possible effect of a minimum wage gap between 12 vs 16 years of school is $V3"
