
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grad_2022/Network/local/cache_helper.dart';
import 'package:grad_2022/inside/models/DiningResponse.dart';
import 'package:grad_2022/inside/models/diningmodel.dart';

import '../../inside/models/loginResponse.dart';
import '../../inside/models/login_model.dart';
import '../../inside/models/userResponse.dart';
import '../../inside/models/user_model.dart';
import '../../shared/variables.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://gp2022.ekosysco.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> Add({required UserModel userModel}) async {
    return await dio?.post('/User/Add', data: {
      "name": userModel.name,
      "phone": userModel.phone,
      "email": userModel.email,
      "addersses": userModel.addresses,
      "password": userModel.password,
      "isactive": userModel.isactive,
    }).then((value) {
      userResponse = UserResponse.fromJson(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  static Future<Response?> login({required LoginModel loginModel}) async {
    return await dio?.post('/User/Search', data: {
      "email": loginModel.email,
      "password": loginModel.password
    }).then((value) {
      loginResponse = LoginResponse.fromJson(value.data);
      loginuserId = loginResponse!.id;
      print('login done -- user id = ${loginuserId}');
      CacheHelper.saveData(key:'loginuserid', value: loginuserId).then((value)
      {
        print('login user id = ${value.toString()}');
      }).catchError((error)
      {
        print(error.toString());
      });

    }).catchError((error) {
      print(error.toString());
    });

  }

  static Future<Response?> FindByIdCategory(
      {required String url, Map<String, dynamic>? query}) async {
    return await dio?.get(
      url,
      queryParameters: query,
    );
  }
static Future<Response?> getdiningdetails()async{
    return await DioHelper.FindByIdCategory(url: '/Dining/FindById',
      query: {"Id":diningdetailsid,
    }).then((value) {
     diningModel=DiningModel.fromJson(value!.data);
     diningname=diningModel!.name.toString();
      diningimage=diningModel!.image.toString();
      dininglogo=diningModel!.logo.toString();
      dininglevel=diningModel!.level;
      diningphonenumber=diningModel!.phonenumber.toString();
     diningemail=diningModel!.email.toString();
     diningwebsite=diningModel!.website.toString();
     print(diningModel.toString());
    }).catchError((error){
      print(error.toString());});
    }

 }
