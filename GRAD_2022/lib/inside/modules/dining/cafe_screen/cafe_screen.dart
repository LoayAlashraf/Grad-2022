import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../information_screen/information_screen.dart';

class CafeScreen extends StatefulWidget {
  @override
  State<CafeScreen> createState() => _CafeScreenState();
}

class _CafeScreenState extends State<CafeScreen> {
  static final List<String> happy = [
    'Cafeshop',
    'Bicafe',
    'Caffe Casa',
    'Caribou Coffe',
    'Cilantro',
    'Costa Coffe',
    'Dunkin Dounts',
    'Espresso Lab',
    'Starbucks',
    'The Coffee Maker',
    'Nero Cafe',
    'House Of Cocoa'
  ];
  List<bool> _isFavorited = List.filled(happy.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cafes'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.builder(
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/images.png'),
                  ),
                  trailing: IconButton(
                    onPressed: () => setState(
                        () => _isFavorited[index] = !_isFavorited[index]),
                    icon: _isFavorited[index]
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${happy[index]}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                          ),
                          Text(
                            'Level0',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformationScreen()));
                  },
                ),
              );
            }));
  }
}
