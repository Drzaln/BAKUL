import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:tour/page/ProfilePage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  CameraPosition _currentCameraPosition;
  LocationData location;

//  PermissionStatus _status;
  GoogleMapController mapController;

  final LatLng _center = LatLng(0, 0);

  void _onMapCreate(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    checkGPS();
    super.initState();
    animationMenu();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void animationMenu() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset(0.0, 0.0))
        .animate(_controller);
  }

  void checkGPS() async {
    Location _locationService = new Location();
    bool _permission = false;
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.HIGH, interval: 1000);

    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status : $serviceStatus");
      if (serviceStatus == false) {
        _permission = await _locationService.requestPermission();
        print("Permission : $_permission");
        if (_permission) {
          location = await _locationService.getLocation();
          _locationService
              .onLocationChanged()
              .listen((LocationData result) async {
            _currentCameraPosition = CameraPosition(
                target: LatLng(result.latitude, result.longitude), zoom: 18.0);
          });
        }
      }
    } catch (e) {}
  }

  _currentCameraPositon() async {
    Location location = new Location();
    var pos = await location.getLocation();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(pos.latitude, pos.longitude),
          zoom: 18.0,
        ),
      ),
    );
    // Marker(
    //   markerId: MarkerId('marker'),
    //   position: LatLng(pos.latitude, pos.longitude),
    //   icon: BitmapDescriptor.defaultMarker,
    // );
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
            IconButton(
              padding: EdgeInsets.only(left: 16.0),
              icon: Icon(FeatherIcons.user),
              onPressed: () {
                goProfile(context);
              },
              color: Colors.blue[700],
              iconSize: 29.0,
            ),
            Text(
              'BAKUL',
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
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 18.0),
            onMapCreated: _onMapCreate,
          ),
          Positioned(
            top: 35.0,
            left: 10.0,
            child: FloatingActionButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              backgroundColor: Colors.white,
              mini: true,
              child: Icon(
                FeatherIcons.arrowLeft,
                color: Colors.blue[700],
                size: 29.0,
              ),
            ),
          ),
          Positioned(
            top: 35.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: Text('pin'),
              onPressed: () {
                _currentCameraPositon();
              },
              backgroundColor: Colors.white,
              mini: true,
              child: Icon(
                Icons.my_location,
                color: Colors.blue[700],
                size: 29.0,
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 30.0,
            right: 30.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              elevation: 5.0,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue[700],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    )),
                height: 50.0,
                width: MediaQuery.of(context).size.width - 10,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Icon(
                        FeatherIcons.search,
                        size: 29.0,
                        color: Colors.blue[700],
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

void goProfile(BuildContext context) {
//  Navigator.of(context).pushNamed('/ProfilePage');
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => ProfilePage(),
    ),
  );
}
