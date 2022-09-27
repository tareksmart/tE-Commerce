
import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/views/pages/bottom_nav_bar.dart';
import 'package:ecommerce/views/pages/checkout/checkout_page.dart';
import 'package:ecommerce/views/pages/home_page.dart';
import 'package:ecommerce/views/pages/landing_page.dart';
import 'package:ecommerce/views/pages/product_details.dart';
import 'package:ecommerce/services/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    case AppRoutes.checkOut:
      return MaterialPageRoute(builder: (_)=>CheckOutPage(),settings: settings);
    case AppRoutes.landingPageRoute:
      return MaterialPageRoute(builder: (_)=>LandingPage(),settings: settings);
    case AppRoutes.productDetails:
      {
        final args=settings.arguments as Map<String,dynamic>;
        final product =args['product'];
        final database=args['database'];
        return MaterialPageRoute(//نسيت ماعمل <Database> لم بحفظ المبيعات
          //provider.value لان شاشة product details لايوجد فوقيها provider احنا هنا بنمرر instance من ال provider على شكل provider.value
            builder: (_) =>Provider<Database>.value(value: database,child: ProductDetails(product: product),),);
      }
      default :
        return MaterialPageRoute(builder: (_)=>LandingPage(),settings: settings);
  }
}