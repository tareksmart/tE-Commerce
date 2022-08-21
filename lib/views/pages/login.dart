import 'package:flutter/material.dart';

import '../../utilities/strings.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _globalKey = GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                logIn,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 64,),
              TextFormField(
                controller: _emailController,
                validator: (val)=>val!.isEmpty?'Please Enter Your Email':'',
                decoration:const InputDecoration(
                    hintText: 'enter email', labelText: 'Email'),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _passwordController,
                validator: (val)=>val!.isEmpty?'Please enter password':'',
                decoration:const InputDecoration(
                    hintText: 'enter passowrd', labelText: 'password'),
              ),
              SizedBox(height: 16,),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: Text('Forgot Your Password?'),
                  onTap: (){},
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
