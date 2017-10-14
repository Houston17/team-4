from flask import Flask, render_template, request, url_for

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
@app.route('/other/',methods = ['POST', 'GET'])
def other():
    if request.method == 'GET':
        getinfo()

def getinfo():
    clients = db.child("test").get();
    for some in clients.each():
        if some.name == "Chris":
            events = key["events"]
            for temp in events:
                pictures = temp.get("pictures")
                des = temp.get("description")
                return {picture_urls: pictures, description: des}

            #result.picture_urls[0].


app.run()
