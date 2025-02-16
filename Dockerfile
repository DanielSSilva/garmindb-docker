# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Prevent Python from writing .pyc files to disk and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install envsubst via the gettext package
# Update package lists and install gettext (envsubst is included)
RUN apt-get update && apt-get install -y gettext
RUN apt-get update && apt-get install -y cron

# Install build dependencies if needed (e.g., if your packages require compilation)
# RUN apt-get update && apt-get install -y build-essential
#COPY ./GarminConnectConfig.json /root/.GarminDb/GarminConnectConfig.json

# Upgrade pip and install Python dependencies
RUN pip install garmindb

# Copy the template configuration file and entrypoint script

COPY GarminConnectConfig.template.json /root/.GarminDb/GarminConnectConfig.template.json
COPY init.sh /app/init.sh

# Ensure the entrypoint script is executable
RUN chmod +x /app/init.sh

# Define the default command to run the application.
# Adjust the script name if the main module is named differently.
ENTRYPOINT ["/app/init.sh"]
CMD ["tail", "-f", "/dev/null"]