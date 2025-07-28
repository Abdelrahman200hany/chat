import 'package:flutter/material.dart';

class CostomTextButtom extends StatelessWidget {
  CostomTextButtom(
      {super.key, required this.text, required this.onPressed});
  final String text;

  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Color.fromARGB(255, 238, 234, 18),
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}


