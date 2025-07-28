import 'package:flutter/material.dart';

class CostomButtom extends StatelessWidget {
  const CostomButtom(
      {super.key,
      required this.text,
      required this.ontap,
      this.Isloading = false});
  final String text;
  final VoidCallback? ontap;
  final bool Isloading;
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
        child: Isloading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
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
