import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Network/bloc_observer.dart';
import 'Network/remote/dio_helper.dart';
import 'Network/remote/dioo_helper.dart';
import 'inside/modules/welcome_page/welcome_page.dart';
import 'online/layout/ShopLayout.dart';
import 'online/layout/cubit/cubit.dart';
import 'online/layout/cubit/states.dart';
import 'online/modules/LayoutScreens/ProductsScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelperr.init();
  DioHelperr.GetAddress();
  DioHelper.init();
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              home: ShopLayout(),
              theme: ThemeData(
                  primarySwatch: Colors.blue),
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
