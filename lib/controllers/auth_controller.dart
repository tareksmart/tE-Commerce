import 'package:ecommerce/models/user_data.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/services/database_controller.dart';
import 'package:ecommerce/utilities/enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../utilities/constants.dart';

class AuthController with ChangeNotifier {
  final Authbase auth;
  final Database database=FireStorDatabase('123');//instance from database
  String email;
  String password;
  AuthFormType authFormType;

  AuthController(
      {required this.auth,
      this.email = '',
      this.password = '',
      this.authFormType = AuthFormType.login});
  void updateEmail(String email) => copyWith(email: email);
  void updatePassword(String password) => copyWith(password: password);
  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(
        email: '',
        password: '',
        authFormType:
            formType); //افرغنا الميل والباس حتى التحويل مابين ال login and register
  }

  //لماذا لم نمرر ال email and password and authformtype
  //لانهم بالفعل جايين من الprovider اللى نوعه authController
  //onChange and authFormType
  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        await auth.signUpWithEmailAndPassword(email, password);
        await database.setUserData(UserData(uid: documentIdFromLocalData(), email: email));
      }
    } catch (e) {
      rethrow;
    }
  }

//هنا دالة ال copy with
//بتستبدل القيم الموجوده بال constructor
//مثل دالة الcopy with
//الموجوده ضمن theme.of(context).color.copywith//كانت بستبدل القيم الموجوده بdefault theme
  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ??
        this.email; //لو ال ايميل جاى فاضى من بره حط قيمة الايميل الموجود بالكونستركتور
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;

    notifyListeners();
  }
}
