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
def home():
    db = firebase.database()
    return render_template('index.html')

@app.route("/<client_id>/new_event", methods = ['GET', 'POST'])
def hello():
    db = firebase.database()

    if request.method == 'POST':
        description = request.form.get('description')
        data = {
            "name": "Chris",
            "events": [
                {
                    "description": description,
                    "pictures": [
                        "url1", "url2"
                    ]
                }
            ]
        }
        db.child("clients").push(data)
        return "Added succesfully"
    else:
        return render_template('new.html')

if __name__ == "__main__":
    app.run()