import 'package:chatapp/views/signin.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String HomeViewId = 'HomeId';

  @override
  Widget build(BuildContext context) {
    return SignInView();
  }
}
