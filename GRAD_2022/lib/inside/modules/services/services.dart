import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.wifi,
            ),
            title: Text(
              'Free Wi-Fi Connection',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.wheelchair_pickup,
            ),
            title: Text(
              'Wheel Chairs',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.wc,
            ),
            title: Text(
              'WC',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.local_parking_outlined,
            ),
            title: Text(
              'Parking',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.atm,
            ),
            title: Text(
              'ATM',
            ),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
