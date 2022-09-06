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
  void toggleFormType(){
    final formType=authFormType==AuthFormType.login?AuthFormType.register:AuthFormType.login;
    copyWith(email: '',password: '',authFormType: formType);//افرغنا الميل والباس حتى التحويل مابين ال login and register
  }
  //لماذا لم نمرر ال email and password and authformtype
  //لانهم بالفعل جايين من الprovider اللى نوعه authController
  //onChange and authFormType
  Future<void> submit() async{
    try
        {
          if(authFormType==AuthFormType.login){
            await auth.loginWithEmailAndPassword(email, password);
          }
          else
            {
              await auth.signUpWithEmailAndPassword(email, password);
            }
        }
        catch(e){rethrow;}
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
