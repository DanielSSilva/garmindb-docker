#!/bin/sh

# Substitute environment variables in the config template to produce config.json
envsubst < /root/.GarminDb/GarminConnectConfig.template.json > /root/.GarminDb/GarminConnectConfig.json

# Optionally, print the final config for debugging
cat /root/.GarminDb/GarminConnectConfig.json
