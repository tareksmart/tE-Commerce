import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.onTap, required this.text})
      : super(key: key);
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(style: ElevatedButton.styleFrom(onSurface: Theme.of(context).primaryColor,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      )) ,

        onPressed: onTap,
        child: Text(text),

      ),
    );
  }
}
