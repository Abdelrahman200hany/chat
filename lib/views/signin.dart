import 'package:chatapp/cores/costomwidgets/TextFormfield.dart';
import 'package:chatapp/cores/costomwidgets/buttoms.dart';
import 'package:chatapp/cores/costomwidgets/textbuttom.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cores/logic/showsnackbar.dart';
import 'package:chatapp/cubit/sign_in/sign_in_cubit.dart';
import 'package:chatapp/views/chat.dart';
import 'package:chatapp/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static String SignInId = 'SignId';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool Isloading = false;
  String? email, password;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInFailure) {
                  Showmessage(context, message: state.errorMessage);
                }
                if (state is SignInSuccess) {
                  Showmessage(context, message: 'login');
                  Navigator.pushReplacementNamed(context, ChatView.id,
                      arguments: email);
                }
              },
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: state is SignInLoading ? true : false,
                  child: Form(
                    key: formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/scholar.png'),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          const Text(
                            'Scholar Chat ',
                            style: TextStyle(
                                fontFamily: 'Pacifico-Regular',
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sign in ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          CostomTextFormField(
                            onchange: (data) {
                              email = data;
                            },
                            hint: 'Abdo123@gamil.com',
                            Label: 'Email',
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          CostomTextFormFieldPassword(
                            hint: 'xxxxxxxxxxxxx',
                            Label: 'password',
                            onchange: (data) {
                              password = data;
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          CostomButtom(
                              Isloading: state is SignInLoading ? true : false,
                              text: 'Sign in',
                              ontap: () async {
                                if (formkey.currentState!.validate()) {
                                  BlocProvider.of<SignInCubit>(context).SignIn(
                                      email: email!, password: password!);
                                }
                              }),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "don't have an accont ? ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              CostomTextButtom(
                                text: 'ٌRegister',
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RegisterView.RegiterId);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
