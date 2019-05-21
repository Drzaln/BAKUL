import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RegisterPage.dart';

class LoginPembeli extends StatelessWidget {
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
            textField('Password'),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                'SIGN IN',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    registerPage(context);
                  },
                  child: Text(
                    'Don`t have an account? Register',
                    style: TextStyle(color: Colors.black45),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void registerPage(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RegisterPage(),
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
