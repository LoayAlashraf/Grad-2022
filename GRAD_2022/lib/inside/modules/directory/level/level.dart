import 'package:flutter/material.dart';

class LevelScreen extends StatelessWidget {
  List LeveL = [
    'LeveL0',
    'LeveL1',
    'LeveL2',
    'LeveL3',
    'LeveL4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: Card(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LeveL[index],
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            );
          }),
    );
  }
}
