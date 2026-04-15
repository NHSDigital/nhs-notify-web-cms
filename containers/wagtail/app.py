"""Minimal Flask app for testing ECS Express Gateway Service."""

from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    """Home page."""
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>NHS Notify CMS</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p>NHS Notify Wagtail CMS - Test Deployment</p>
    </body>
    </html>
    """


@app.route("/health/")
def health():
    """Health check endpoint for ECS."""
    return jsonify({"status": "healthy"}), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
