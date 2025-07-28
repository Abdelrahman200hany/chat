import 'package:flutter/material.dart';

class CostomTextFormField extends StatelessWidget {
  const CostomTextFormField({
    super.key,
    required this.hint,
    required this.Label,
    required this.onchange,
  });
  final String hint;
  final String Label;
  final Function(String data)? onchange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return ' field is required';
          }
        },
        style: const TextStyle(
          color: Colors.white,
        ),
        onChanged: onchange,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color:  Color.fromARGB(255, 221, 214, 214)),
          labelText: Label,
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:const  BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CostomTextFormFieldPassword extends StatefulWidget {
  const CostomTextFormFieldPassword({
    super.key,
    required this.hint,
    required this.Label,
    required this.onchange,
  });
  final String hint;
  final String Label;
  final Function(String data)? onchange;

  @override
  State<CostomTextFormFieldPassword> createState() =>
      _CostomTextFormFieldPasswordState();
}

class _CostomTextFormFieldPasswordState
    extends State<CostomTextFormFieldPassword> {
  bool IsHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return ' field is required';
          }
        },
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: IsHidden,
        onChanged: widget.onchange,
        decoration: InputDecoration(
          suffix: IconButton(
            onPressed: () {
              IsHidden =! IsHidden;
              setState(() {});
            },
            icon: Icon(
              IsHidden ? Icons.visibility_off_sharp : Icons.visibility,
              color: Colors.white,
            ),
          ),
          hintText: widget.hint,
          hintStyle:const  TextStyle(color: const Color.fromARGB(255, 221, 214, 214)),
          labelText: widget.Label,
          labelStyle:const  TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
