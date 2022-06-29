import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Network/remote/dio_helper.dart';
import '../../../shared/variables.dart';
import '../../models/user_model.dart';
import '../login_page/login_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _LoginScreen3State();
}

class _LoginScreen3State extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  bool secureP = true;
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: name,
                  onChanged: (text) {},
                  onFieldSubmitted: (Value) {
                    print(Value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name must not be empty';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: email,
                  onChanged: (text) {},
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
                  onChanged: (text) {},
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
                      prefixIcon: Icon(Icons.lock),
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
                TextFormField(
                  controller: phone,
                  onChanged: (text) {},
                  maxLength: 11,
                  onFieldSubmitted: (Value) {
                    print(Value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number must not be empty';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      suffixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.send))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child: MaterialButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        UserModel userModel = UserModel();
                        userModel.name = name.text;
                        userModel.email = email.text;
                        userModel.phone = phone.text;
                        userModel.password = password.text;
                        userModel.isactive = 0;
                        if (_formKey.currentState!.validate()){
                        await DioHelper.Add(userModel: userModel);
                        if (userResponse == null) {
                          return null;
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        }}
                      }),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
