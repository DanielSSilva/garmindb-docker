#!/bin/sh

# Substitute environment variables in the config template to produce config.json
envsubst < /root/.GarminDb/GarminConnectConfig.template.json > /root/.GarminDb/GarminConnectConfig.json

# Optionally, print the final config for debugging
cat /root/.GarminDb/GarminConnectConfig.json

# Execute the command passed to the container.
# If no command is passed, the default CMD (tail) will keep it alive.
exec "$@"