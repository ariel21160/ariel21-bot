#!/usr/bin/env bash

# Do an inline sync first, then start the background job
echo "Starting sync..."
back/sync.sh
if [ "$READ_ONLY" != "true" ]; then
  eval "while true; do sleep ${AWS_SYNC_INTERVAL:-60}; back/sync.sh; done &"
  sync_pid=$!
fi

echo "Iniciando bot"
npm start