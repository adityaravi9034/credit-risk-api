# Use Python 3.10 slim as base image
FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files into the container
COPY . /app

# Upgrade pip and install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Expose port 8080
EXPOSE 8080

# Set environment variable for Flask
ENV FLASK_APP=app.py

# Run the app using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
