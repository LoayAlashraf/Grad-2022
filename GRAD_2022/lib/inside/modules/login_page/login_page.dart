
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Network/remote/dio_helper.dart';
import '../../../shared/variables.dart';
import '../../models/login_model.dart';
import '../home_page/home_page.dart';
import '../registration_page/registration_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  bool secureP = true;
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'EASE Mall',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('Hello');
              },
              icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(

                  controller: email,
                  onFieldSubmitted: (Value) {
                    print(Value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email must not be empty';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password must not be empty';
                    }
                    ;
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: secureP,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            secureP = !secureP;
                            setState(() {});
                          },
                          icon: secureP
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      LoginModel loginModel = LoginModel();
                      loginModel.email = email.text;
                      loginModel.password = password.text;
                      var a = await DioHelper.login(loginModel: loginModel);
                      if (loginResponse == null) {
                        showAlertDialog(BuildContext context) {
                          // set up the button
                          Widget okButton = TextButton(
                            child: Text("OK"),
                            onPressed: () {},
                          );

                          // set up the AlertDialog
                          AlertDialog alert = AlertDialog(
                            title: Text("Error"),
                            content: Text("Email OR Password is Not Found"),
                            actions: [
                              okButton,
                            ],
                          );

                          // show the dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ));
                        },
                        child: Text('Sign up here' ,style: TextStyle(color: Colors.blue),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
