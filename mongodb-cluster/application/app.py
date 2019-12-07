from flask import Flask
from flask_pymongo import PyMongo

app = Flask(__name__)
app.secret_key = "inibuatBDT"
app.config["MONGO_URI"] = "mongodb://192.168.33.21:27017/kickstarter?authSource=admin&retryWrites=false"
mongo = PyMongo(app)