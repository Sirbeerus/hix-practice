#!/bin/bash  

<< com

read -p "Hello, print the current Cardano market places projects.. key value pair? (y/n) " yn

case $yn in 
	y ) curl 'https://cnft.tools/lists/all' | jq -S 'to_entries | map( {(.value.name): .key}) | add'
	n ) echo exiting...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac



echo "Which project would you like stats on? \"name\""  
read projectName

 

echo "Okay, Project..  $projectName"  

curl 'https://cnft.tools/lists/all' | jq -S 'to_entries | map( {(.value.name): .key}) | add' | grep $projectName

wait



jq --arg v "$PRJNAME" '.dev.projects[$v]' config.json




% curl -s 'https://cnft.tools/lists/all' | jq  '.[36]'
{
  "name": "mutantmice",
  "projectName": "mutantmice",
  "fullName": "Mutant Mice",
  "totalSales": 1104179,
  "totalVolume": 4113,
  "sevenDaySales": 13501,
  "sevenDayVolume": 16,
  "circulation": 5000,
  "floorPrice": 845,
  "onMarket": 76,
  "marketPct": 1.52,
  "sevenDayShort": "13.5K",
  "shortName": "Mutant Mice"
}






# echo "#!/bin/bash" > script.sh

com

curl 'https://cnft.tools/lists/all' | jq -S 'to_entries | map( {(.value.name): .key}) | add' 

echo "Which project would you like stats on? \"name\""
read projectName



echo "Okay, Project..  $projectName"

curl 'https://cnft.tools/lists/all' | jq -S 'to_entries | map( {(.value.name): .key}) | add' | grep $projectName

wait





# curl 'https://cnft.tools/lists/all' | jq 'to_entries | map( {(.value.name): .key}) | add' | grep $projectName
# wait
# curl 'https://cnft.tools/lists/all' | jq -r --arg var "$pname" '.[$var]'
# sleep 2

curl -X GET https://api.coingecko.com/api/v3/ping





