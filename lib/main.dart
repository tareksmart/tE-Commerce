import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/utilities/router.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<Authbase>(//بروفيدر من authBase
      create: (_)=>Auth(),
      child: MaterialApp(
        title: 'E commerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 2),
          primaryColor:const Color(0xFFDB3022),
          buttonTheme: ButtonThemeData(
            buttonColor: const Color(0xFFDB3022),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          scaffoldBackgroundColor: const Color(0xFFE5E5E5),
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
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: Colors.red),
              )),
        ),
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.landingPageRoute,

      ),
    );
  }
}
