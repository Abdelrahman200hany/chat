import 'package:flutter/material.dart';

class CostomButtom extends StatelessWidget {
  const CostomButtom({super.key, required this.text, required this.ontap});
  final String text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xff2b475e)),
        ),
      ),
    );
  }
}
