from flask import Flask
import socket
import os
import time
import redis
import mysql.connector

app = Flask(__name__)

r = redis.Redis(
    host=os.getenv("REDIS_HOST", "redis"),
    port=6379,
    decode_responses=True,
)

def get_db():
    return mysql.connector.connect(
        host=os.getenv("MYSQL_HOST", "mysql"),
        user=os.getenv("MYSQL_USER", "root"),
        password=os.getenv("MYSQL_PASSWORD", "rootpass"),
        database=os.getenv("MYSQL_DB", "appdb"),
    )

@app.route("/")
def home():
    return f"Hello from {socket.gethostname()}"

@app.route("/count")
def count():
    value = r.incr("hits")
    return f"Server={socket.gethostname()} Visits={value}"

@app.route("/users")
def users():
    cache_key = "users:all"
    cached = r.get(cache_key)
    if cached:
        return f"Server={socket.gethostname()} cache=HIT users={cached}"

    # cache MISS -> read DB -> fill cache
    time.sleep(1)  # pretend DB is slower
    conn = get_db()
    cur = conn.cursor()
    cur.execute("SELECT name FROM users ORDER BY id")
    names = [row[0] for row in cur.fetchall()]
    cur.close()
    conn.close()

    joined = ",".join(names)
    r.setex(cache_key, 30, joined)  # cache 30 seconds
    return f"Server={socket.gethostname()} cache=MISS users={joined}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)