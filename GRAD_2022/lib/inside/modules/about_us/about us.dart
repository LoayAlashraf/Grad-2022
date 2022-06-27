import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABOUT US'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage(
                   'http://www.citystars-heliopolis.com.eg/public/images/mall/citystars-heliopolis-about-us.jpg?1495050288538'
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Citystars Project Brief',

                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(height: 15,),
                  Text('Citystars Heliopolis:',

                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  SizedBox(height: 15,),
                  Text('Citystars Heliopolis is Cairo’s first integrated real estate development of its kind in Egypt. It spans over an area of 750,000 sqm in the heart of Cairo, with investments worth well over 1.5 billion US Dollars.',
                    style: TextStyle(
                      fontSize: 15,

                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Citystars Heliopolis is a living landmark in Cairo that operates on a number of different levels. There are four components in all; shopping and entertainment, offices, residential and hospitality with three international hotels; Intercontinental Cairo Citystars, Holiday Inn Cairo Citystars and Staybridge Suites Cairo Citystars.',
                    style: TextStyle(
                      fontSize: 15,

                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Citystars Project Components',

                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(height: 15,),
                  Text('Stars Centre – The height of shopping and entertainment:',

                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(height: 12,),
                  Text('Stars Centre is the retail and leisure component of the Citystars Heliopolis complex and provides a unique shopping and entertainment experience to the Middle East.',
                    style: TextStyle(
                      fontSize: 15,

                    ),
                  ),
                  SizedBox(height: 12,),
                  Text('With the best local retailers combined for the first time with international brand names, shopping has not only become a pleasure but an entirely new experience. In fact, more than just shopping, Stars Centre offers a combination of entertainment and dining facilities that are unmatched anywhere else in Cairo some of which are Mosaique dining zone and the Family Restaurant Area. In addition to the unrivaled 21-screen cinema complex, Stars Centre also contains Golden Stars Cinema. These cinemas feature recliner seating in a refined interior design while serving delicious meals and refreshments during the movie display by Holiday Inn Cairo Citystars in addition to our VIP restaurants Mori Sushi and Tamara. The premises contain two indoor theme parks; E-Zone and Magic Galaxy, which cover a combined area of almost 9000 sqm.',
                    style: TextStyle(
                      fontSize: 15,

                    ),
                  ),
                  SizedBox(height: 12,),
                  Text('Star Capital – Modern Office Towers:',

                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(height: 12,),
                  Text('Stars Capital is the best office suite in Cairo, with 70,000 sqm of office space. Built in accordance to the highest and the most sophisticated international standards. Star Capital boasts AAA clients of world-renowned national and multinational companies.',

                    style: TextStyle(
                      fontSize: 15,


                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}
