curl localhost:1026/v2/entities -s -S --header 'Content-Type: application/json' \
    -X POST -d @- <<EOF
{
  "id": "Room2",
  "type": "Room",
  "temperature": {
    "value": 23,
    "type": "Number"
  },
  "pressure": {
    "value": 720,
    "type": "Number"
  }
}
EOF

curl localhost:1026/v2/entities/Room2 -s -S --header 'Accept: application/json' | python -mjson.tool

curl localhost:1026/v2/entities/Room2/attrs/temperature/value -s -S \
    --header 'Content-Type: text/plain' \
    -X PUT -d 26.3