import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../online/layout/ShopLayout.dart';
import '../mall_page/mall_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Choose Your Shopping Experience'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Stack(

        children: [
          Container(

            decoration: BoxDecoration(

                image: DecorationImage(
                  image: AssetImage('assets/images/mall_background.jpg'),
                  fit: BoxFit.cover,




                )

            ),

          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  child: MaterialButton(
                    onPressed: ()
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopLayout(),
                          )
                      );

                    },
                    color: Colors.red,
                    child: Text('Online Shopping',
                      style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 30

                      ),

                    ),
                    textColor: Colors.white,
                    height: 50,




                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MallPage(),
                          )
                      );


                    },
                    color: Colors.blueAccent,
                    child: Text('Inside Mall Shopping', style: TextStyle(

                        fontWeight: FontWeight.bold,
                        fontSize: 30

                    ),),
                    textColor: Colors.white,
                    height: 50,




                  ),
                ),
              ],
            ),
          ),



        ],
      ),

    );
  }
}
