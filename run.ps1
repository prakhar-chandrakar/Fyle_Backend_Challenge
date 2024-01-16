# run.ps1

# Set FLASK_APP environment variable
$env:FLASK_APP = "core/server.py"

# Run the Flask application using flask run
flask run