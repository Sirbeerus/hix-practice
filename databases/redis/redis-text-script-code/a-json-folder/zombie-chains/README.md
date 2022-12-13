

------------------------------------------------------------------------------
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
------------------------------------------------------------------------------


-----------------------------------------------------------------------------

--ISOLATED INDEXED VARIABLES

$ curl 'https://cnft.tools/lists/all' | jq 'to_entries[38] | [.key, .value.name]'

[
  38,
  "zombiechains"
]



$ curl 'https://cnft.tools/lists/all' | jq 'to_entries[38] | [.key, .value.onMarket] '

[
  38,
  580
]


--LISTS JSON OUTPUT IN AN INDEXED ARRAY


$ curl 'https://cnft.tools/lists/all' | jq 'to_entries[38] | [.key, .value]'

[
  38,
  {
    "name": "zombiechains",
    "projectName": "zombiechains",
    "fullName": "Zombie Chains",
    "totalSales": 3735097,
    "totalVolume": 11742,
    "sevenDaySales": 15954,
    "sevenDayVolume": 44,
    "circulation": 10000,
    "floorPrice": 189,
    "onMarket": 580,
    "marketPct": 5.8,
    "sevenDayShort": "16K",
    "shortName": "Zombie Chains"
  }
]


------------------------------------------------------------------------------


--SEARCH

$ curl 'https://cnft.tools/lists/all' | jq 'to_entries | map( {(.value.name): .key}) | add' | grep zombiechains


 "zombiechains": 38,



--SPECIFIC VALUES as JSON OUTOUT

$ curl -H "Accept: application/json" 'https://cnft.tools/lists/all' | jq 'to_entries[38] | .value.name, .value.floorPrice, .value.onMarket'

"zombiechains"
189
580




--ALTERNATE WAY OF RETRIEVING JSON OUTLPUT

$ curl 'https://cnft.tools/lists/all' | jq '.[] |  .name, .projectName, .floorPrice, .onMarket '


"claynation"
"claynation"
3400
566
140
501
"oremob"
"oremob"
420
1706
"spacebudz"
"spacebudz"
4150
872
"themallardorder"
"themallardorder"
1144
489
"apesocietycabins"
"apesocietycabins"
670
627
"claynationxgoodcharlotte"
"claynationxgoodcharlotte"
1039
485




-- JSON WITH INDEXING

$ curl 'https://cnft.tools/lists/all' | jq 'to_entries[38]'


{
  "key": 38,
  "value": {
    "name": "zombiechains",
    "projectName": "zombiechains",
    "fullName": "Zombie Chains",
    "totalSales": 3735097,
    "totalVolume": 11742,
    "sevenDaySales": 15954,
    "sevenDayVolume": 44,
    "circulation": 10000,
    "floorPrice": 189,
    "onMarket": 580,
    "marketPct": 5.8,
    "sevenDayShort": "16K",
    "shortName": "Zombie Chains"
  }
}

curl 'https://cnft.tools/lists/all' | jq '.[] | select(.name == "zombiechain")'
{
  "name": "zombiechains",
  "projectName": "zombiechains",
  "fullName": "Zombie Chains",
  "totalSales": 3737040,
  "totalVolume": 11750,
  "sevenDaySales": 14795,
  "sevenDayVolume": 38,
  "circulation": 10000,
  "floorPrice": 174,
  "onMarket": 607,
  "marketPct": 6.07,
  "sevenDayShort": "14.8K",
  "shortName": "Zombie Chains"
}


-----------------------------------------------------------------------------
-H "Accept: application/json"
-H "Connection: keep-alive"
---------------------------------------------------------------------------------

We can use the –-output flag that allows to write the output of the cURL command to a file instead of stdout. So let’s write the output to a file called output.txt
b30761fae22" --output output.txt
