# Use an official Python runtime as a parent image
FROM python:3.9-slim
# Or python:3.6-slim if you must stick to the older version

WORKDIR /usr/src/app

# Install necessary packages (if any beyond Python standard lib + requirements)
# RUN apt-get update && apt-get install -y --no-install-recommends some-package && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt ./

# Install any needed packages specified in requirements.txt
# --no-cache-dir prevents caching which saves space
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Run main.py when the container launches
CMD ["python3", "main.py"]
