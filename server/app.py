from flask import Flask, render_template, request

import pyrebase

config = {
  "apiKey": "AIzaSyAgGz6LMi_EyddbkmDgi-Qicc4-Ba13rkQ",
  "authDomain": "code-for-good-2017.firebaseapp.com",
  "databaseURL": "https://code-for-good-2017.firebaseio.com",
  "storageBucket": "code-for-good-2017.appspot.com",
  "projectId": "code-for-good-2017",
  "serviceAccount": "service_account.json"
}

firebase = pyrebase.initialize_app(config)

app = Flask(__name__)

@app.route("/")
def hello():
    db = firebase.database()
    data = { "hello": "world" }
    db.child("test").push(data)
    return "Hello World2!"

db = firebase.database()
@app.route('/other',methods = ['POST', 'GET'])
def other():
    if request.methods == 'GET':
        getinfo()

def getinfo(name):
    clients = db.child("test");
    for key in clients:
        if key.get("name") == name:
            events = key.get("events")
            for temp in events:
                pictures = temp.get("pictures")
                des = temp.get("description")
                #send these pictures & description back


app.run()
