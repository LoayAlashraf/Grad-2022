import 'package:flutter/material.dart';
import 'package:grad_2022/inside/modules/cinema_page/vedio_screen.dart';

class CinemaScreen extends StatefulWidget {
  const CinemaScreen({Key? key}) : super(key: key);

  @override
  State<CinemaScreen> createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  List<String> images = [
    "assets/images/11.jpg",
    "assets/images/99.jpg",
    "assets/images/88.jpg",
    "assets/images/22.png",
  ];
  List<String> name = [
    'Multiverse Of Madness ',
    'Uncharted',
    'Top Gun',
    'Battman',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.5,
                children: List.generate(
                    4,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoApp()));
                          },
                          child: Container(
                            color: Colors.grey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Image.asset(
                                      images[index],
                                      width: double.infinity,
                                      height: 200.0,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${name[index]}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          height: 1.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CinemaPage extends StatefulWidget {
  const CinemaPage({Key? key}) : super(key: key);

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  static final List<String> entity = [
    'VIP Cinema',
    'Stars Cinema',
    'Diamond Cinema',
    'Golden Stars Cinema'
  ];
  List<bool> _isFavorited = List.filled(entity.length, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CINEMA'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/gb.jpg'),
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
                        '${entity[index]}',
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
                            builder: (context) => CinemaScreen()));
                  },
                ),
              );
            }));
  }
}
