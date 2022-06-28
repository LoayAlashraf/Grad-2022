import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page/home_page.dart';
import '../login_page/login_page.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


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
            child: Container(
              height: 150,

              decoration: BoxDecoration(

                  image: DecorationImage(image: AssetImage('assets/images/mall_logo.png'))
                  ,
                  color: Colors.white.withOpacity(0.7)
              ),

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    child: MaterialButton(
                      onPressed: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            )
                        );

                      },
                      color: Colors.red,
                      child: Text('MEMBER'),
                      textColor: Colors.white,
                      height: 30,



                    ),
                  ),
                  Container(
                    width: 180,
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            )
                        );

                      },
                      color: Colors.blueAccent,
                      child: Text('GUEST'),
                      textColor: Colors.white,
                      height: 30,




                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ],
          ),



        ],
      ),

    );
  }
}
