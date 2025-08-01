import 'package:chatapp/cores/costomwidgets/responsemessage.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cubit/chat/chat_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CostomtextfieldChat extends StatelessWidget {
  CostomtextfieldChat({super.key, required this.email});
  var email;


  TextEditingController controller = TextEditingController();
  final scrollController = ResponseMessages.scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onSubmitted: (value) {
   BlocProvider.of<ChatCubit>(context).sendMessage(message: value, email: email);
          controller.clear();
          scrollController.animateTo(0,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn);
        },
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  // to read the any thing that you write in text filedl
                  final messageText = controller.text;
                  if (messageText.isNotEmpty) {
                    //check there was text on the textfield
               BlocProvider.of<ChatCubit>(context).sendMessage(message: messageText, email: email);
                    // to clear the text in text form
                    controller.clear();
                    scrollController.animateTo(0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
              ),
            ),
            hintText: 'أرسال ',
            hintStyle: const TextStyle(color: kPrimaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                ))),
      ),
    );
  }
}
