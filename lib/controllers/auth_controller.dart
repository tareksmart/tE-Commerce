import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/utilities/enum.dart';
import 'package:flutter/foundation.dart';

class AuthController with ChangeNotifier {
  final Authbase auth;
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
