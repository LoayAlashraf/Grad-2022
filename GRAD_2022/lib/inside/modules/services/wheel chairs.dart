import 'package:flutter/material.dart';
import 'package:grad_2022/inside/modules/mall_map_screen/mall_map_screen.dart';

class WheelChairs extends StatefulWidget {
  const WheelChairs({Key? key}) : super(key: key);

  @override
  State<WheelChairs> createState() => _WheelChairsState();
}

class _WheelChairsState extends State<WheelChairs> {
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
                  image: NetworkImage('http://www.citystars-heliopolis.com.eg/public/images/service_web_logo/H17POKvwx-main.png?1495050287042'))

            ],
          ),
          SizedBox(
            height: 10,
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5,),
          Text('Wheel Chairs',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,),),
          SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('''For the elderly and people with special needs, we provide free wheel chair service to facilitate transportation and touring inside our shopping centre.
Pick-up Location: Information Desks.        
                           ''', style: TextStyle(fontSize: 15.0 ,) ,
    ),
        ),
          Container(color: Colors.black.withOpacity(0.7),
              child: TextButton(onPressed: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MallMapScreen()));}, child: Text('SHOW ON MAP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),)))
        ],),
    );
  }
}
