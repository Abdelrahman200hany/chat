import 'package:chatapp/cores/costomwidgets/TextFormfield.dart';
import 'package:chatapp/cores/costomwidgets/buttoms.dart';
import 'package:chatapp/cores/costomwidgets/textbuttom.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cores/logic/showsnackbar.dart';
import 'package:chatapp/views/chat.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String RegiterId = 'register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? password;

  String? email;

  bool Isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Isloading,
      child: Scaffold(
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
                   const    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Register ',
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
                        hint: 'Abdo123@gamil.com',
                        Label: 'Email',
                        onchange: (data) {
                          email = data;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CostomTextFormFieldPassword(
                    
                        hint: 'xxxxxxxxxxxx',
                        Label: 'password',
                        onchange: (data) {
                          password = data;
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CostomButtom(
                        text: 'Register',
                        ontap: () async {
                          if (formkey.currentState!.validate()) {
                            Isloading = true;
                            setState(() {});
                            try {
                              await RegisterUser();
                              Showmessage(context, message: ' success');
                              Navigator.pushReplacementNamed(
                                  context, ChatView.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (ex) {
                              if (ex.code == 'weak-password') {
                                Showmessage(context,
                                    message: ' weak password ');
                              } else if (ex.code == 'email-already-in-use') {
                                Showmessage(context,
                                    message: ' email is already used ');
                              } else if (ex.code == 'invalid-email') {
                                Showmessage(context, message: 'invalid email ');
                              }
                            } catch (e) {
                              Showmessage(context,
                                  message: ' try again later ');
                            }
                            Isloading = false;
                            setState(() {});
                          }
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const     Text(
                            "i have an account ! ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          CostomTextButtom(
                            text: 'sign in',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> RegisterUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
