import 'package:flutter/material.dart';
import 'package:grad_2022/shared/variables.dart';

import '../../../inside/modules/login_page/login_page.dart';
import '../../../shared/components/components.dart';
import '../Address_Screen/Address_Screen.dart';
import 'MyCart.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('images/jjjj.png'),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 20,),
              defaultButton(
                  text: 'Account Settings',
                  function: () {  }),
              SizedBox(height: 20,),
              defaultButton(
                  text: 'My Cart',
                  function: ()
                  {
                    navigateTo(context, MyCartScreen());
                  }),

              SizedBox(height: 20,),
              defaultButton(
                  text: 'Address',
                  function: ()
                  {
                    navigateTo(context, AddressScreen());
                  }),
              SizedBox(height: 20,),
              defaultButton(
                  text: 'LogOut',
                  function: ()
                  {
                    loginuserId = null ;
                    navigateTo(context, LoginScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
