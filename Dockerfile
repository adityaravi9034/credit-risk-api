# Use Python 3.10 slim as base
FROM python:3.10-slim

# Install libgomp and other necessary libraries
RUN apt-get update && \
    apt-get install -y libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files into the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Start the app with Gunicorn
CMD ["gunicorn", "-b", ":8080", "app:app"]
