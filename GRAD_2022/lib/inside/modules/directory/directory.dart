import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'a_to_z/a_to_z.dart';
import 'categoriea/categoriea.dart';
import 'level/level.dart';

class Directiry extends StatefulWidget {
  @override
  _DirectiryState createState() => _DirectiryState();
}

class _DirectiryState extends State<Directiry> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIRECTORY'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body:
      Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),
           // onChanged: ,
          ),
        ),

        Container(
          child: TabBar(
        controller: _tabController,
    // give the indicator a decoration (color and border radius)
    indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(
    25.0,
    ),
    color: Colors.grey,
    ),
    labelColor: Colors.white,
    unselectedLabelColor: Colors.black,
    tabs: [
    // first tab [you can add an icon using the icon property]
    Tab(
    text: 'Levels',
    ),

    // second tab [you can add an icon using the icon property]
    Tab(
    text: 'Categories',
    ),
      Tab(
        text: 'A  to Z',
      ),
    ],
    ),
    ),
        Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  [
               LevelScreen(),
                Categories(),
                AzScreen(),
              ],
            )
        )
      ]),
    );
  }
}
