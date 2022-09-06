import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/utilities/enum.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utilities/strings.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _globalKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passFocusNode = FocusNode();
 // dynamic _authType = AuthFormType;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Authbase>(context);
    return ChangeNotifierProvider(
      create: (_) => AuthController(auth: auth),
      child: Scaffold(
        resizeToAvoidBottomInset:
            false /*تجنب تجاوز القاع بسبب ظهور لوحةالمفاتيح*/,
        body: SafeArea(
            //layout بتاخد المساحه مابين statusbar and bottombar
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 32),
          child: Consumer<AuthController>(builder: (context, authController, child) {
            return
            Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authController.authFormType == AuthFormType.login ? logIn : register,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  TextFormField(
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passFocusNode),
                    textInputAction: TextInputAction.next,
                    controller: _emailController,
                    onChanged: authController.updateEmail,
                    validator: (val) =>
                        val!.isEmpty ? 'Please Enter Your Email' : null,
                    decoration: const InputDecoration(
                        hintText: 'enter email', labelText: 'Email'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    focusNode: _passFocusNode,
                    controller: _passwordController,
                    onChanged: authController.updatePassword,//الدالة بتاخد email كقيمة onChanged بها قيمة فالكومبيلر بيظبط قيمة onChanged ويمررها الى updatePassword
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter password' : null,
                    decoration: const InputDecoration(
                        hintText: 'enter passowrd', labelText: 'password'),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Text(authController.authFormType  == AuthFormType.login
                          ? 'Forgot Your Password?'
                          : ''),
                      onTap: () {},
                    ),
                  ),
                  MainButton(
                      onTap: () {
                        if (_globalKey.currentState!.validate()) {
                          print('${authController.email}');
                          debugPrint('${authController.password}');
                         // Navigator.of(context)
                            //  .pushNamed(AppRoutes.bottomNavBar);
                        }
                      },
                      text: authController.authFormType  == AuthFormType.login ? logIn : register),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                          child: Text(authController.authFormType  == AuthFormType.login
                              ? 'Don\'t have an account?Register'
                              : 'Have an Account login'),
                          onTap: () {
                            _emailController.clear();
                            _passwordController.clear();
                            _globalKey.currentState!.reset();
                            setState(() {
                              if (_authType == AuthFormType.register) {
                                _authType = AuthFormType.login;
                              } else {
                                _authType = AuthFormType.register;
                              }
                            });
                          })),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      authController.authFormType  == AuthFormType.login
                          ? 'Or Login With Social Account'
                          : 'Or Register With Social Account',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: const Icon(Icons.sensor_occupied_sharp),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: const Icon(Icons.adb_outlined),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
          ),
        )),
      ),
    );
  }
}
