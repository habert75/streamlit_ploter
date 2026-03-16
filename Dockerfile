FROM python:3.11-slim

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY plot.py .
COPY img.jpg .
COPY .streamlit .streamlit

# Expose the configured port
EXPOSE 8502

# Run the application
CMD ["streamlit", "run", "plot.py", "--server.address", "0.0.0.0"]
