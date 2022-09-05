import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/utilities/enum.dart';
import 'package:flutter/foundation.dart';

class AuthController with ChangeNotifier{
  final Authbase auth;
  String email;
  String Password;
  AuthFormType authFormType;

  AuthController({required this.auth, this.email='', this.Password='', this.authFormType=AuthFormType.login});
}