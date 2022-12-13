curl -o output.json -XGET 'https://cnft.tools/lists/all'

$ curl 'https://cnft.tools/lists/all' | jq 'to_entries '

$ curl 'https://cnft.tools/lists/all' | jq 'to_entries | map( { (.value.name): .key} ) | add' | grep zombiechains


curl 'https://cnft.tools/lists/all' | jq '[.[].name]'        (filter name index)
curl 'https://cnft.tools/lists/all' | jq '.[] |  .name, .floorPrice' (filter multiple index)
       						---------------------
curl 'https://cnft.tools/lists/all' | jq . | grep \"name	    |
curl 'https://cnft.tools/lists/all' | jq . | grep \"zombiechains    |  (search)
                     				---------------------

curl 'https://cnft.tools/lists/all' | jq '.[0]'


curl http://api.open-notify.org/iss-now.json | jq '.'

curl 'https://cnft.tools/lists/all' | jq 'to_entries[]' (index json columns)
