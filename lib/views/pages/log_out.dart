import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth=Provider.of<Authbase>(context);
    return Container(child: Column(children: [
      Center(child: MaterialButton(onPressed: ()=>auth.signOut(),child: Text('log out'),),)
    ],),);
  }
}
