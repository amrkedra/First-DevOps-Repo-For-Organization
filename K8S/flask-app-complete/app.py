from flask import Flask, request, render_template
import redis
import os

app = Flask(__name__)

# Redis connection using environment variables
redis_host = os.getenv("REDIS_HOST", "redis-service")  # Only the hostname, no port
redis_port = int(os.getenv("REDIS_PORT", 85))  # The service port (85)

redis_client = redis.StrictRedis(
    host=redis_host,
    port=redis_port,
    db=0,
    decode_responses=True
)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    name = request.form['name']
    age = request.form['age']
    
    user_id = redis_client.incr('user_id')  # Increment user_id for unique identification
    redis_client.hmset(f"user:{user_id}", {"name": name, "age": age})
    
    return "Data Submitted!"

@app.route('/users', methods=['GET'])
def users():
    users = []
    for key in redis_client.scan_iter("user:*"):
        user_data = redis_client.hgetall(key)
        users.append(user_data)
    return render_template('users.html', users=users)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
