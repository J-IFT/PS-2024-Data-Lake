import time
import json
from kafka import KafkaProducer
from faker import Faker

fake = Faker()
producer = KafkaProducer(bootstrap_servers='localhost:9092', value_serializer=lambda v: json.dumps(v).encode('utf-8'))

def generate_vehicle_data():
    return {
        "vehicle_id": fake.uuid4(),
        "location": {
            "latitude": fake.latitude(),
            "longitude": fake.longitude()
        },
        "speed": fake.random_int(min=0, max=120),
        "fuel_consumption": fake.random_int(min=5, max=20),
        "timestamp": int(time.time())
    }

while True:
    data = generate_vehicle_data()
    producer.send('vehicle_data_topic', value=data)
    time.sleep(1)