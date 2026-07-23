from flask import Flask
import socket
import os
import redis

app = Flask(__name__)
r = redis.Redis(host=os.getenv("REDIS_HOST", "redis"), port=6379, decode_responses=True)

@app.route("/")
def home():
    return f"Hello from {socket.gethostname()}"

@app.route("/count")
def count():
    value = r.incr("hits")
    return f"Server={socket.gethostname()} Visits={value}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)