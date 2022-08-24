
import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/views/pages/bottom_nav_bar.dart';
import 'package:ecommerce/views/pages/home_page.dart';
import 'package:ecommerce/views/pages/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/pages/auth_page.dart';

Route<dynamic> onGenerate(RouteSettings settings){
  switch (settings.name){
    case AppRoutes.logIn:
      return MaterialPageRoute(builder: (context) => AuthPage(),);
    case AppRoutes.homePage:
      return MaterialPageRoute(builder: (_)=>HomePage());
    case AppRoutes.bottomNavBar:
      return MaterialPageRoute(builder: (_)=>BottomNavBar());
    case AppRoutes.landingPageRoute:
      default :
        return MaterialPageRoute(builder: (_)=>LandingPage(),);
  }
}