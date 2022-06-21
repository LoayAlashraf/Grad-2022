
import 'package:flutter/material.dart';

import '../../../shared/variables.dart';
import '../dining/cafe_screen/cafe_screen.dart';
import '../product_page/product_screen.dart';

class FashionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FASHION'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Footwear & Leather Goods'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(cat_id = 1)));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('Jewllery'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen()));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('Kid\'s Wear'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen()));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('ladies\' Wear'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen()));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('Lingerie'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen()));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('Men\'s Wear'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(cat_id = 1)));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('Optics'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(cat_id = 3)));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('Scarves'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen()));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('Sports Wear'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen()));
            },
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            title: Text('Watches'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeScreen()));
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
