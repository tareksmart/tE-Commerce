import 'package:ecommerce/utilities/router.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E commerce',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE5E5E5),
        primaryColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.subtitle1,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: Colors.blueGrey),
          )
        ),
      ),
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.logIn,
      home: Container(),
    );
  }
}
