from flask import Flask, request, render_template
import redis
import os

app = Flask(__name__)

# Redis connection
redis_client = redis.StrictRedis(
    host=os.getenv("DB_HOST", "redis-service"),
    port=6379,
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
