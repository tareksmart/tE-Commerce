import 'package:ecommerce/utilities/enum.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

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
  dynamic _authType=AuthFormType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false/*تجنب تجاوز القاع بسبب ظهور لوحةالمفاتيح*/,
      body: SafeArea(
          //layout بتاخد المساحه مابين statusbar and bottombar
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 32),
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _authType==AuthFormType.login? logIn:register,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 64,
              ),
              TextFormField(
                controller: _emailController,
                validator: (val) =>
                    val!.isEmpty ? 'Please Enter Your Email' : null,
                decoration: const InputDecoration(
                    hintText: 'enter email', labelText: 'Email'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _passwordController,
                validator: (val) => val!.isEmpty ? 'Please enter password' : null,
                decoration: const InputDecoration(
                    hintText: 'enter passowrd', labelText: 'password'),
              ),
              const SizedBox(
                height: 16,
              ),

              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: Text(_authType==AuthFormType.login?'Forgot Your Password?':''),
                  onTap: () {},
                ),
              ),
              MainButton(onTap: () {
                if(_globalKey.currentState!.validate())
                  debugPrint('authentivated');
              },
                  text:_authType==AuthFormType.login? logIn:register),
              const SizedBox(
                height: 16,
              ),
               Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      child: Text(_authType==AuthFormType.login? 'Don\'t have an account?Register':'Have an Account login'),
                  onTap: (){
                    setState(() {
                      if(_authType==AuthFormType.register)
                        {
                          _authType=AuthFormType.login;

                        }
                      else
                        {
                          _authType=AuthFormType.register;
                        }
                    });
                  })),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(_authType==AuthFormType.login?
                  'Or Login With Social Account':'Or Register With Social Account',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const  SizedBox(
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
                    child:const Icon(Icons.sensor_occupied_sharp),
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
        ),
      )),
    );
  }
}
