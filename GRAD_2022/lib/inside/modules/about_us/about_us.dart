import 'package:flutter/material.dart';
import 'package:grad_2022/inside/modules/about_us/about%20us.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About US'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.account_box_outlined,
            ),
            title: Text(
              'About Us',
            ),
            onTap: ()  {
            Navigator.push(context,
                 MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.hourglass_bottom,
            ),
            title: Text(
              'Working Hours',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.rule_sharp,
            ),
            title: Text(
              'Rules & Regulations',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.waterfall_chart,
            ),
            title: Text(
              'Terms & Conditions',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.privacy_tip,
            ),
            title: Text(
              'Privacy Policiy',
            ),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
