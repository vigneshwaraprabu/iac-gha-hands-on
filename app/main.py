from flask import Flask
from app.config import get_config

app = Flask(__name__)

@app.route("/")
def hello():
    config_value = get_config("MY_APP_CONFIG")
    return f"Hello, World! Config: {config_value}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
