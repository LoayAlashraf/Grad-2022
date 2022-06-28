import 'package:flutter/material.dart';
import 'package:grad_2022/inside/modules/services/parking.dart';
import 'package:grad_2022/inside/modules/services/wheel%20chairs.dart';
import 'package:grad_2022/inside/modules/services/wifi.dart';

import '../../../shared/variables.dart';
import '../dining/cafe_screen/cafe_screen.dart';

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
            onTap: ()  {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Wifi()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.wheelchair_pickup,
            ),
            title: Text(
              'Wheel Chairs',
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WheelChairs()));
            },
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
            onTap: ()  {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Parking()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.atm,
            ),
            title: Text(
              'ATM',
            ),
            onTap: ()  {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen(din_id=4)));
            },
          ),
        ],
      ),
    );
  }
}
