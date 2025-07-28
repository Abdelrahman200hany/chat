import 'package:flutter/material.dart';

class CostomTextButtom extends StatelessWidget {
  const CostomTextButtom({super.key, this.text, required this.onPressed});
  final String? text;
  final Function()? onPressed;
  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              text!,
              style: const TextStyle(
                  color: Color.fromARGB(255, 238, 234, 18),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
    );
  }
}
