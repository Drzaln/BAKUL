import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 32.0, right: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'gambar/bakulLogo.png',
              width: 146.0,
              height: 73.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.0),
            ),
            textField('Username'),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
            ),
            textField('E-mail'),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
            ),
            textField('Password'),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
            ),
            textField('Repeat Password'),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
            ),
            MaterialButton(
              onPressed: _handleSignIn,
              child: Text(
                'REGISTER',
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.only(right: 64.0, left: 64.0),
              color: Colors.blue[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

textField(hintText) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue[700],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        )),
    height: 50.0,
    width: double.infinity,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.black45),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
