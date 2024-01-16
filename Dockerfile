FROM python:3.8-slim

WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Reset the database
RUN export FLASK_APP=core/server.py && \
    rm core/store.sqlite3 && \
    flask db upgrade -d core/migrations/

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME World

# Run flask app when the container launches
CMD ["bash", "run.sh"]