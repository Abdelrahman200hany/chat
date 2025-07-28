  import 'package:flutter/material.dart';

void Showmessage(BuildContext context, { required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }