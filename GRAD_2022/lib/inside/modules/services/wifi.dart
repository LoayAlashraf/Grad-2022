import 'package:flutter/material.dart';

class Wifi extends StatefulWidget {
  const Wifi({Key? key}) : super(key: key);

  @override
  State<Wifi> createState() => _WifiState();
}

class _WifiState extends State<Wifi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FREE WI-FI CONNECTION'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
   body:Column(
        children: [
          Stack(
            fit:StackFit.loose,
            children: [
              Image(height: 200,
                  image: NetworkImage('http://www.citystars-heliopolis.com.eg/public/images/service_web_logo/BJoFPYDDe-main.png?1495050286842'))

            ],
          ),
          SizedBox(
            height: 10,
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5,),
          Text('Free Wi-Fi Connection',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,),),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('''Our valued customers can enjoy the free Wi-Fi connection by subscribing through their mobile network (Etisalat / Vodafone / Orange).        
                           ''', style: TextStyle(fontSize: 15.0 ,) ,
            ),
          ),
        ],),
    );
  }
}
