import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.onTap, required this.text, required this.hasCircularBorder})
      : super(key: key);
  final VoidCallback onTap;
  final String text;
  final bool hasCircularBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor,
      shape:hasCircularBorder?RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ):null) ,

        onPressed: onTap,
        child: Text(text),

      ),
    );
  }
}
