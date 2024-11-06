# Use latest Ubuntu image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-setuptools \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Reinstall pip in case of any issues with dependencies
RUN python3 -m pip install --upgrade pip

# Install PyYAML
RUN pip3 install PyYAML

# Copy Python script and entrypoint script to the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Define the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
