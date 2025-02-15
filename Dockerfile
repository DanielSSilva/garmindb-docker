# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Prevent Python from writing .pyc files to disk and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install build dependencies if needed (e.g., if your packages require compilation)
# RUN apt-get update && apt-get install -y build-essential
COPY ./GarminConnectConfig.json /root/.GarminDb/GarminConnectConfig.json

# Upgrade pip and install Python dependencies
RUN pip install garmindb

# Define the default command to run the application.
# Adjust the script name if the main module is named differently.
ENTRYPOINT ["/bin/bash"]