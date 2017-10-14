from flask import Flask

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

#trying with flask
from flask import Flask, render_template, redirect, url_for, request

# route for handling the login page logic
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != 'admin' or request.form['password'] != 'admin':
            error = 'Invalid Credentials. Please try again.'
        else:
            return redirect(url_for('home'))
    return render_template('login.html', error=error)

#trying with firebase attempt 1

from firebase import firebase
firebase = firebase.FirebaseApplication('https://your_storage.firebaseio.com', authentication=None)
result = firebase.get('/users', None, {'print': 'pretty'})
print result
{'error': 'Permission denied.'}

authentication = firebase.Authentication('THIS_IS_MY_SECRET', 'ozgurvt@gmail.com', extra={'id': 123})
firebase.authentication = authentication
print authentication.extra
{'admin': False, 'debug': False, 'email': 'ozgurvt@gmail.com', 'id': 123, 'provider': 'password'}

user = authentication.get_user()
print user.firebase_auth_token
"eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJhZG1pbiI6IGZhbHNlLCAiZGVidWciOiBmYWxzZSwgIml
hdCI6IDEzNjE5NTAxNzQsICJkIjogeyJkZWJ1ZyI6IGZhbHNlLCAiYWRtaW4iOiBmYWxzZSwgInByb3ZpZGVyIjog
InBhc3N3b3JkIiwgImlkIjogNSwgImVtYWlsIjogIm96Z3VydnRAZ21haWwuY29tIn0sICJ2IjogMH0.lq4IRVfvE
GQklslOlS4uIBLSSJj88YNrloWXvisRgfQ"

result = firebase.get('/users', None, {'print': 'pretty'})
print result
{'1': 'John Doe', '2': 'Jane Doe'}

#trying with firebase attempt 2

# Get a reference to the auth service
auth = firebase.auth()

# Log the user in
user = auth.sign_in_with_email_and_password(email, password)

#***********me just trying stuff****************
#if !email:
#    auth.create_user_with_email_and_password(email, password)
#    auth.send_email_verification(user['idToken'])
#elif !password:
#    auth.send_password_reset_email("email")
#else:
#    auth.get_account_info(user['idToken'])
#*****************************************************

# before the 1 hour expiry:
user = auth.refresh(user['refreshToken'])
# now we have a fresh token
user['idToken']

# Get a reference to the database service
db = firebase.database()

# data to save
data = {
    "name": "Mortimer 'Morty' Smith"
}
db.child("users").child("Morty").set(data)
# Pass the user's idToken to the push method
results = db.child("users").push(data, user['idToken'])
