import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPembeliPage.dart';

class PilihPage extends StatelessWidget {
  var round = 20.0;
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: tinggi * 0.15,
              left: lebar / 4.5,
              child: MaterialButton(
                onPressed: () {
                  print('tes');
                },
                color: Colors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(round),
                  ),
                ),
                child: Container(
                  width: lebar / 2,
                  height: tinggi / 3,
                  child: Center(
                      child: Text(
                    'Pedagang',
                    style: TextStyle(color: Colors.white, fontSize: 32.0),
                  )),
                ),
              ),
            ),
            Positioned(
              top: tinggi * 0.55,
              left: lebar / 4.5,
              child: MaterialButton(
                onPressed: () {
                  loginPembeli(context);
                },
                color: Colors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(round),
                  ),
                ),
                child: Container(
                  width: lebar / 2,
                  height: tinggi / 3,
                  child: Center(
                    child: Text(
                      'Pembeli',
                      style: TextStyle(color: Colors.white, fontSize: 32.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginPembeli(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => LoginPembeli(),
      ),
    );
  }
}
