import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_2022/shared/variables.dart';
import 'Network/bloc_observer.dart';
import 'Network/local/cache_helper.dart';
import 'Network/remote/dio_helper.dart';
import 'Network/remote/dioo_helper.dart';
import 'inside/modules/home_page/home_page.dart';
import 'inside/modules/welcome_page/welcome_page.dart';
import 'online/layout/cubit/cubit.dart';
import 'online/layout/cubit/states.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelperr.init();
  // DioHelperr.GetAddress();
  DioHelper.init();
  await CacheHelper.init();

  loginuserId = CacheHelper.getData(key: 'loginuserId');

  Widget widget;
  print(loginuserId);
  if(loginuserId == null)
  {
     widget = WelcomePage();
  }
  else widget = HomePage();
  runApp( MyApp(
    startWidget: widget,
  ));
  HttpOverrides.global = MyHttpOverrides();}

class MyApp extends StatelessWidget {

  final Widget startWidget;
  MyApp({
    // required this.onBoarding,
    required this.startWidget,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider(
            create: (BuildContext context)=>ShopCubit()..getHomeData()..getCategoryData(),
          )
        ],
        child: BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {},
          builder: (context,state) {
            return MaterialApp(
              home: startWidget,
              theme: ThemeData(
                  primarySwatch: Colors.deepOrange),
              debugShowCheckedModeBanner: false,    );
            },
        ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
