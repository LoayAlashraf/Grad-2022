import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MallMapScreen extends StatefulWidget {
  const MallMapScreen({Key? key}) : super(key: key);
  @override
  _MallMapScreenState createState() => _MallMapScreenState();
}

class _MallMapScreenState extends State<MallMapScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    Container(
      child: PhotoView(
        imageProvider: AssetImage("assets/images/1-1.jpg"),
      ),
    ),
    Container(
        child: PhotoView(
      imageProvider: AssetImage("assets/images/1-2.jpg"),
    )),
    Container(
        child: PhotoView(
      imageProvider: AssetImage("assets/images/1-1.jpg"),
    )),
    Container(
        child: PhotoView(
      imageProvider: AssetImage("assets/images/1-2.jpg"),
    )),
    Container(
        child: PhotoView(
      imageProvider: AssetImage("assets/images/1-1.jpg"),
    )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('MALL MAP'),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard_outlined,
            ),
            label: 'Level -2',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard_outlined,
            ),
            label: 'Level -1',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard_outlined,
            ),
            label: 'Level 0',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard_outlined,
            ),
            label: 'Level 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard_outlined,
            ),
            label: 'Level 2',
          ),
        ],
      ),
    );
  }
}
