import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  final String buttonText;
  VoidCallback onButtonPress;

   Buttons({ 
    super.key,
    required this.buttonText,
    required this.onButtonPress
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton( 
      onPressed: onButtonPress,
      child: Text(buttonText,style: TextStyle(fontSize: 15),),
      color: const Color.fromARGB(255, 255, 138, 177),
      );
  }
}