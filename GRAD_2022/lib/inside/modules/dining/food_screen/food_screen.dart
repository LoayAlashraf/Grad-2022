import 'package:flutter/material.dart';
import 'package:grad_2022/shared/variables.dart';

import '../cafe_screen/cafe_screen.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DINING'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.local_cafe),
            title: Text('Cafes'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen(din_id=1)));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Restaurant'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen(din_id=2)));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('FastFood'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen(din_id=3)));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
