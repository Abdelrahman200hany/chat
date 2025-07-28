import 'package:chatapp/cores/costomwidgets/TextFormfield.dart';
import 'package:chatapp/cores/costomwidgets/buttoms.dart';
import 'package:chatapp/cores/costomwidgets/textbuttom.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cores/logic/showsnackbar.dart';
import 'package:chatapp/views/chat.dart';
import 'package:chatapp/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/scholar.png'),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                const     Text(
                      'Scholar Chat ',
                      style: TextStyle(
                          fontFamily: 'Pacifico-Regular',
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05),
                const     Align(
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
                        height: MediaQuery.of(context).size.height * 0.02),
                    CostomTextFormField(
                      onchange: (data) {
                        email = data;
                      },
                      hint: 'Abdo123@gamil.com',
                      Label: 'Email',
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                    CostomTextFormFieldPassword(
                      hint: 'xxxxxxxxxxxxx',
                      Label: 'password',
                      onchange: (data) {
                        password = data;
                      },
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                    CostomButtom(
                  
                      text: 'Sign in',
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          Isloading = true;
                          setState(
                            () {},
                          );
                          try {
                            await SignIn();
                            Showmessage(context, message: 'login');
                            Navigator.pushReplacementNamed(
                                context, ChatView.id,
                                arguments: email);
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'invalid-credential') {
                              Showmessage(context, message: 'wrong password');
                            } else if (ex.code == 'user-not-found') {
                              Showmessage(context,
                                  message: 'user not found  ');
                            } else if (ex.code == 'invalid-email') {
                              Showmessage(context,
                                  message: 'invalid Email  ');
                            } else if (ex.code == 'network-request-failed') {
                              Showmessage(context,
                                  message: 'please , Connect to netwok ');
                            }
                          } catch (e) {
                            Showmessage(context,
                                message:
                                    'sorry there was an error , please try later ');
                          }
                          Isloading = false;
                          setState(
                            () {},
                          );
                        }
                      },
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     const    Text(
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
          ),
        ),
      ),
    );
  }

  Future<void> SignIn() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
