import 'package:flutter/material.dart';

class PilihPage extends StatelessWidget {
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
              top: tinggi * 0.2,
              left: lebar * 0.1,
              child: Card(
                child: Container(
                  width: lebar / 2,
                  height: tinggi / 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
