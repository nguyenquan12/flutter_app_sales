import 'package:app_sales/presertation/features/cart/cart_screen.dart';
import 'package:app_sales/presertation/features/home/home_screen.dart';
import 'package:app_sales/presertation/features/sign_in/sign_in_screen.dart';
import 'package:app_sales/presertation/features/sign_up/sign_up_screen.dart';
import 'package:app_sales/presertation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/sign-in": (context) => SignInScreen(),
        "/sign-up": (context) => SignUpScreen(),
        "/home": (context) => HomeScreen(),
        "/splash": (context) => SplashScreen(),
        "/cart": (context) => CartScreen(),
      },
      initialRoute: "/splash",
    );
  }
}
