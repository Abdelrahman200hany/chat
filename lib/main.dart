
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/views/chat.dart';
import 'package:chatapp/views/home.dart';
import 'package:chatapp/views/register.dart';
import 'package:chatapp/views/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterView.RegiterId: (context) => const RegisterView(),
        SignInView.SignInId: (context) => const SignInView(),
        HomeView.HomeViewId: (context) => const HomeView(),
        ChatView.id: (context) => ChatView(),
        
      },
      theme: ThemeData(colorSchemeSeed: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.HomeViewId,
    );
  }
}
