import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class WelcomeUserGoogle extends StatelessWidget {
  late GoogleSignIn _googleSignIn;
  late User _user;

  WelcomeUserGoogle(User user, GoogleSignIn signIn, {super.key}) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                  child: Image.network(_user.photoURL!,
                      width: 100, height: 100, fit: BoxFit.cover)),
              const SizedBox(height: 20),
              const Text('Welcome,', textAlign: TextAlign.center),
              Text(_user.displayName!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 20),
              const Text('E-mail,', textAlign: TextAlign.center),
              Text(_user.email!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  _googleSignIn.signOut();
                  Navigator.pushReplacementNamed(context, '/homepage');
                  // Navigator.pop(context, false);
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.redAccent),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Log out of Google',
                            style: TextStyle(color: Colors.white))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WelcomeUserFacebook extends StatelessWidget {
  late User _user;

  WelcomeUserFacebook(User user, {super.key}) {
    _user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                  child: Image.network(_user.photoURL!,
                      width: 100, height: 100, fit: BoxFit.cover)),
              const SizedBox(height: 20),
              const Text('Welcome,', textAlign: TextAlign.center),
              Text(_user.displayName!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 20),
              const Text('E-mail,', textAlign: TextAlign.center),
              Text(_user.email!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  FacebookAuth.instance.logOut();
                  Navigator.pushReplacementNamed(context, '/homepage');
                  // Navigator.pop(context, false);
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.redAccent),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Log out of Facebook',
                            style: TextStyle(color: Colors.white))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WelcomeUserEmail extends StatelessWidget {
  late User _user;

  WelcomeUserEmail(User user, {super.key}) {
    _user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                  child: Image.network(_user.photoURL!,
                      width: 100, height: 100, fit: BoxFit.cover)),
              const SizedBox(height: 20),
              const Text('Welcome,', textAlign: TextAlign.center),
              Text(_user.displayName!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 20),
              const Text('E-mail,', textAlign: TextAlign.center),
              Text(_user.email!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/homepage');
                  // Navigator.pop(context, false);
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.redAccent),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Log out of Email Account',
                            style: TextStyle(color: Colors.white))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WelcomeUserGuest extends StatelessWidget {
  late User _user;

  WelcomeUserGuest(User user, {super.key}) {
    _user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text('Welcome,', textAlign: TextAlign.center),
              Text(_user.displayName == null ? "Invitado" : _user.displayName!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 20),
              const Text('E-mail,', textAlign: TextAlign.center),
              Text(_user.email == null ? "No Email" : _user.email!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/homepage');
                  // Navigator.pop(context, false);
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.redAccent),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Log out of Guest Account',
                            style: TextStyle(color: Colors.white))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
