#!/bin/bash

echo "1. 301 https redirect test"
echo "$ curl -I http://airline.local"
curl -I http://airline.local
echo

echo "2. Load balancing test"
for i in $(seq 1 5)
do
    echo "$ curl -ks https://airline.local | grep TeamAirlines"
    curl -ks https://airline.local | grep TeamAirlines
done
echo

echo "3. Backup server switch test"
echo "Press Enter when one of the two backends goes down."
read
echo "$ curl -ks https://airline.local | grep TeamAirlines"
curl -ks https://airline.local | grep TeamAirlines
echo

echo "4. Auth test (no credentials supplied)"
echo "$ curl -ks https://airline.local/admin/"
curl -ks https://airline.local/admin/
echo

echo "5. Different host test"
echo "$ curl -ks --header 'Host: second.local' https://airline.local"
curl -ks --header 'Host: second.local' https://airline.local
echo

echo "6. Custom 404 page"
echo "$ curl -ks https://airline.local/some-non-existent-stuff"
curl -ks https://airline.local/some-non-existent-stuff
echo

echo "7. Request flood"
for i in $(seq 1 45)
do
    echo "$ curl -ks -o /dev/null -w "HTTP %{http_code}\n" https://airline.local/api/list"
    curl -ks -o /dev/null -w "HTTP %{http_code}\n" https://airline.local/api/list
done
