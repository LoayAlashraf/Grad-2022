//import 'dart:_http';

// class DioHelper {
//   static Dio? dio;
//
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://localhost:44315',
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }
//
// static Future<Response?> Add({required UserModel userModel}) async {
//   (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//       (HttpClient dioClient) {
//     dioClient.badCertificateCallback =
//     ((X509Certificate cert, String host, int port) => true);
//     return dioClient;
//   };
// return await dio?.post('/Inside/Add', data: {
//   'id':userModel.id,
// 'name': userModel.name,
// 'phone': userModel.phone,
// 'email': userModel.email,
// 'password': userModel.password,
// 'isactive': userModel.isactive,
// }).then((value) {
// userResponse = UserResponse.fromJson(value.data);
// }).catchError((error) {
// print(error.toString());
// });
//  }
// static Future<Response?> Search({required LoginModel loginModel}) async {
//
//     return await dio?.post('/Inside/Search', data: {
//
//       'password': loginModel.password,
//       'email': loginModel.email,
//     }).then((value) {
//       loginResponse = LoginResponse.fromJson(value.data);
//     }).catchError((error) {
//       print(error.toString());
//     });
//   }
// }

import 'package:dio/dio.dart';

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
}
