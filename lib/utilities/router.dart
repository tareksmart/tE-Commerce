
import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/views/pages/bottom_nav_bar.dart';
import 'package:ecommerce/views/pages/home_page.dart';
import 'package:ecommerce/views/pages/landing_page.dart';
import 'package:ecommerce/views/pages/product_details.dart';

import 'package:flutter/material.dart';

import '../models/product.dart';
import '../views/pages/auth_page.dart';

Route<dynamic> onGenerate(RouteSettings settings){
  switch (settings.name){
    case AppRoutes.logIn:
      return MaterialPageRoute(builder: (context) => AuthPage(),
      settings: settings);
    case AppRoutes.homePage:
      return MaterialPageRoute(builder: (_)=>HomePage(),settings: settings);
    case AppRoutes.bottomNavBar:
      return MaterialPageRoute(builder: (_)=>BottomNavBar(),settings: settings);
    case AppRoutes.landingPageRoute:
      return MaterialPageRoute(builder: (_)=>LandingPage(),settings: settings);
    case AppRoutes.productDetails:
      {
        final product =settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetails(product: product), settings: settings);
      }
      default :
        return MaterialPageRoute(builder: (_)=>LandingPage(),settings: settings);
  }
}