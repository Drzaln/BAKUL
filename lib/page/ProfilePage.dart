import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;

  void animationMenu() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset(0.0, 0.0))
        .animate(_controller);
  }

  @override
  void initState() {
    animationMenu();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              onPressed: () {
                back(context);
              },
              mini: true,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(
                  FeatherIcons.arrowLeft,
                  color: Colors.blue[700],
                  size: 29.0,
                ),
              ),
            ),
            Text(
              'PROFILE',
              style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400),
            ),
            IconButton(
              padding: EdgeInsets.only(right: 16.0),
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                size: 29.0,
                progress: _controller,
                semanticLabel: 'Show menu',
              ),
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                  return;
                }
                _controller.reverse();
              },
              color: Colors.blue[700],
              iconSize: 29.0,
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 200.0,
            left: 30.0,
            right: 30.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Container(
                height: 300.0,
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    Text('1'),
                    Text('2'),
                    Text('3'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150.0,
            child: CircleAvatar(
                radius: 70.0,
                backgroundImage: CachedNetworkImageProvider(
                  'https://linkconnects.com/uploads/d3ab3e7df0d626f98bb84c9a97982d4d.jpg',
                )
                //https://linkconnects.com/uploads/d3ab3e7df0d626f98bb84c9a97982d4d.jpg
                ),
          ),
          sideMenu(),
        ],
      ),
    );
  }

  sideMenu() {
    return Positioned(
      right: 10.0,
      left: 150.0,
      bottom: 10.0,
      child: SlideTransition(
        position: _animation,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Container(
            height: 100.0,
            width: 300.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      _showDialog();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'About',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign Out',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About'),
          content: Text(
              'Aplikasi ini dibuat oleh Doddy Rizal Novianto (4611417023), untuk menyelesaikan tugas dari mata kuliah RPL.'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        );
      },
    );
  }
}

void back(BuildContext context) {
  Navigator.of(context).pop(true);
}
