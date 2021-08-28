#!/bin/bash

CONF=/home/athul/bin/curl.cfg

function resume() {
  torrent_ids=$(curl -sd '{"method": "core.get_torrents_status", "params": ["", ""], "id": 1}' -K $CONF | jq  '.result | keys[] as $k | .[$k] | select (.is_seed == false and .paused == true)|$k')
  params=`tr '\n' ',' <<< "$torrent_ids"`
  arg="{\"method\": \"core.resume_torrents\", \"params\": [[${params::-1}]], \"id\": 1}"
  result=$(curl -sd "$arg" -K $CONF)
  echo $result
}

function pause() {
  torrent_ids=$(curl -sd '{"method": "core.get_torrents_status", "params": ["", ""], "id": 1}' -K $CONF | jq  '.result | keys[] as $k | .[$k] | select (.is_seed == false and .paused == false)|$k')
  params=`tr '\n' ',' <<< "$torrent_ids"`
  arg="{\"method\": \"core.pause_torrents\", \"params\": [[${params::-1}]], \"id\": 1}"
  result=$(curl -sd "$arg" -K $CONF)
  echo $result
}

function auth() {
  result=$(curl -sd '{"method": "auth.login", "params": ["pass"], "id": 1}' -K $CONF)
}

if [ "$1" = "resume" ]; then
  auth
  resume
elif [ "$1" = "pause" ]; then
  auth
  pause
fi
