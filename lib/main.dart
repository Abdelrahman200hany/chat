import 'package:chatapp/cubit/register/register_cubit.dart';
import 'package:chatapp/cubit/sign_in/sign_in_cubit.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/views/chat.dart';
import 'package:chatapp/views/home.dart';
import 'package:chatapp/views/register.dart';
import 'package:chatapp/views/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
      ],
      child: MaterialApp(
        routes: {
          RegisterView.RegiterId: (context) => const RegisterView(),
          SignInView.SignInId: (context) => const SignInView(),
          HomeView.HomeViewId: (context) => const HomeView(),
          ChatView.id: (context) => const ChatView(),
        },
        theme: ThemeData(colorSchemeSeed: Colors.white),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeView.HomeViewId,
      ),
    );
  }
}
