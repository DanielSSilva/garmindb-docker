#!/bin/sh

# Substitute environment variables in the config template to produce config.json
envsubst < /root/.GarminDb/GarminConnectConfig.template.json > /root/.GarminDb/GarminConnectConfig.json

echo "0 17 * * * /usr/bin/python3 garmindb_cli.py --all --download --import --analyze --latest >> /var/log/garmindb.log 2>&1" > /etc/cron.d/garmindb-cron && \
    chmod 0644 /etc/cron.d/garmindb-cron && \
    crontab /etc/cron.d/garmindb-cron


garmindb_cli.py --all --download --import --analyze --latest
# Optionally, print the final config for debugging
# Execute the command passed to the container.
# If no command is passed, the default CMD (tail) will keep it alive.

exec "$@"