import 'package:chatapp/cores/costomwidgets/responsemessage.dart';
import 'package:chatapp/cores/costomwidgets/textfieldchatview.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  static String id = 'Chatview';

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(kloge, height: 36, width: 36),
            const Text(
              ' chat',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //to read a message a firebase
          ResponseMessages(
            email: email,
          ),
          //to write  a message to firebase
          CostomtextfieldChat(
            Email: email,
          ),
        ],
      ),
    );
  }
}
