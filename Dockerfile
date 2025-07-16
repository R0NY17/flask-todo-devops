# Use the official Python base image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy only requirements first for caching
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip \
 && pip install -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose port (Flask default)
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
