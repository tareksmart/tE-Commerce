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
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
        style: ButtonStyle(shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        ),


      ),
    );
  }
}
