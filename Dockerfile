# Use an official Python runtime as a parent image
# Using python:3.6-slim as specified in the README
FROM python:3.6-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the dependencies file to the working directory
COPY requirements.txt ./

# Install any needed packages specified in requirements.txt
# --no-cache-dir: Disables the cache to keep the image size smaller
# --trusted-host pypi.python.org: Sometimes needed in specific network environments
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Make port 6379 available to the world outside this container (if needed, though Redis client usually doesn't need exposure)
# This is more illustrative; the app connects *out* to Redis.

EXPOSE 80

# Define environment variables placeholders (will be set during runtime, e.g., by Kubernetes)
# ENV REDIS_HOST=redis
# ENV REDIS_PORT=6379
# ENV REDIS_CHANNEL=log_channel

# Run main.py when the container launches
CMD ["python3", "main.py"]
