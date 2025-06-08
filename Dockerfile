FROM python:3.10.8-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=10000

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /MovieMagnetRoBot

# Copy requirements first for better caching
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r /requirements.txt

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port for Render
EXPOSE $PORT

# Run the start script
CMD ["/bin/bash", "/start.sh"]
