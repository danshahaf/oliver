#!/bin/bash

while IFS='=' read -r key value
do
  # Skip lines that are empty or start with '#'
  if [[ -z "$key" || "$key" =~ ^# ]]; then
    continue
  fi
  echo "Adding $key to Vercel environment variables"
  echo "$value" | vercel env add "$key" .env.local
done < .env.local
