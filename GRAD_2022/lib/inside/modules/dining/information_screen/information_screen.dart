
import 'package:flutter/material.dart';
import 'package:grad_2022/inside/modules/dining/information_screen/gallery.dart';
import 'package:grad_2022/shared/variables.dart';
import 'package:url_launcher/url_launcher.dart'as UrlLauncher;
import '../../mall_map_screen/mall_map_screen.dart';
import 'package:share_plus/share_plus.dart';

class InformationScreen extends StatefulWidget {
  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

double tr = 15;
double tx = 0.25;

class _InformationScreenState extends State<InformationScreen> {
  Color _iconColor = Colors.grey;
  IconData _iconShape = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(diningname.toString()),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
          Image(
          image: NetworkImage(
          diningimage.toString(),
        ),

          ),
                  Container(
                    color: Colors.black.withOpacity(0.7),
                    padding: EdgeInsets.symmetric(
                      vertical: 3,
                    ),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MallMapScreen()));
                      },
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      label: Text(
                        'SHOW ON MAP',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(2),
                  child: Image(
                    image: NetworkImage(
                      dininglogo.toString(),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(_iconShape),
                  color: _iconColor,
                  onPressed: () {
                    setState(() {
                      if (_iconColor == Colors.grey) {
                        _iconShape = Icons.favorite;
                        _iconColor = Colors.red;
                      } else {
                        _iconShape = Icons.favorite_border;
                        _iconColor = Colors.grey;
                      }
                    });
                  },
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     diningname.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                        Text(
                          'Level${dininglevel}',
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 10,
                  end: 10,
                  top: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * tx,
                            margin: EdgeInsets.all(4),
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'CALL',
                                style: TextStyle(
                                  fontSize: tr,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                UrlLauncher.launch('tel:+${diningphonenumber.toString()}');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * tx,
                            margin: EdgeInsets.all(4),
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'EMAIL',
                                style: TextStyle(
                                  fontSize: tr,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                UrlLauncher.launch('mailto:${diningemail}');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * tx,
                            margin: EdgeInsets.all(4),
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'WEBSITE',
                                style: TextStyle(
                                  fontSize: tr,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed:(){
                                UrlLauncher.launch('${diningwebsite}');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * tx,
                            margin: EdgeInsets.all(4),
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'WAYFINDER',
                                style: TextStyle(
                                  fontSize: tr,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * tx,
                            margin: EdgeInsets.all(4),
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'GALLERY',
                                style: TextStyle(
                                  fontSize: tr,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryPage()));
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * tx,
                            margin: EdgeInsets.all(4),
                            color: Colors.black87,
                            child: TextButton(
                              child: Text(
                                'SHARE',
                                style: TextStyle(
                                  fontSize: tr,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Share.share('${diningwebsite}', subject: 'Look what I made!');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(4),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      color: Colors.black87,
                      child: TextButton(
                        child: Text(
                          'VIRTUALTOUR',
                          style: TextStyle(
                            fontSize: tr,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'From roasting coffee for the worlds biggest coffee brands, '
                            'to the mastery of coffee preparation, Attibassi brand was born in Bologna in 1918',
                            style: TextStyle(
                                fontSize: 0.7 * tr, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

