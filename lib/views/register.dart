import 'package:chatapp/cores/costomwidgets/TextFormfield.dart';
import 'package:chatapp/cores/costomwidgets/buttoms.dart';
import 'package:chatapp/cores/costomwidgets/textbuttom.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cores/logic/showsnackbar.dart';
import 'package:chatapp/cubit/register/register_cubit.dart';
import 'package:chatapp/views/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String RegiterId = 'register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? password;

  String? email;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacementNamed(context, ChatView.id,
              arguments: email);
        }
        if (state is RegisterFailure) {
          Showmessage(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is RegisterLoading ? true : false,
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
                              'Register ',
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
                            hint: 'Abdo123@gamil.com',
                            Label: 'Email',
                            onchange: (data) {
                              email = data;
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          CostomTextFormFieldPassword(
                            hint: 'xxxxxxxxxxxx',
                            Label: 'password',
                            onchange: (data) {
                              password = data;
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          CostomButtom(
                            Isloading: state is RegisterLoading ? true : false,
                            text: 'Register',
                            ontap: () async {
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<RegisterCubit>(context)
                                    .register(
                                  email: email!,
                                  password: password!,
                                );
                              }
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
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
      },
    );
  }
}
