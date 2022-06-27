
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
  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      'Levels',
      'Categories',
      'A to Z',
    ];
    const primary = Colors.blueGrey;
    int activeMenu = 0;

    List<Widget> screens = [
      LevelScreen(),
      Categories(),
      AzScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('DIRECTORY'),
        centerTitle: true,
      ),
      body:
      Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),
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
        // Row(
        //   children: List.generate(menuItems.length, (index) {
        //     return Padding(
        //       padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        //       child: InkWell(
        //         onTap: () {
        //           setState(() {
        //             activeMenu = index;
        //           });
        //         },
        //         child: Container(
        //           decoration: BoxDecoration(
        //               border: Border(
        //                   bottom: BorderSide(
        //                       color: activeMenu == index
        //                           ? primary
        //                           : Colors.transparent,
        //                       width: 2))),
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Text(
        //               '${menuItems[index]}',
        //               style: TextStyle(fontSize: 17),
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   }),
        // ),
        Expanded(
          child: Container(
            child: screens[activeMenu],
          ),
        )
      ]),
    );
  }
}
