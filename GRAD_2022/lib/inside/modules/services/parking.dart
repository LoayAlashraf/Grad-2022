import 'package:flutter/material.dart';

class Parking extends StatefulWidget {
  const Parking({Key? key}) : super(key: key);

  @override
  State<Parking> createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PARKING'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(
        children: [
        Stack(
          fit:StackFit.loose,
          children: [
            Image(height: 200,
                image: NetworkImage('http://www.citystars-heliopolis.com.eg/public/images/service_web_logo/ByWbdKPvg-main.png?1495050286997'))

          ],
        ),
          SizedBox(
            height: 10,
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5,),
          Text('Parking',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,),)
      ],),
    );
  }
}
