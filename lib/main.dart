import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/network/shard_pref.dart';
import 'package:shop_app/screen/auth/login_screen.dart';
import 'package:shop_app/screen/view/home_layout_screen.dart';


import 'package:shop_app/screen/view/on_boarding_screen.dart';
import 'cubit/combnites.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await SharedPref.init();




runApp( MyApp());
  }








class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit()..getData()..getCategories()..getFavorites()..getUserData(),

      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {},
        builder: (context, state) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeLayoutScreen(),
            routes: {
              '/onBoarding_screen': (context) => OnBoardingScreen(),
              '/onLogin_screen': (context) => LoginScreen(),
              '/home_layout_screen': (context) => HomeLayoutScreen(),
              '/login_screen': (context) => LoginScreen(),
            },
          );
        },
      ),
    );
  }
}
