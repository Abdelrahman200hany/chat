import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cores/message_model.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.messages,
  });
  final MessageModel messages;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(16).copyWith(left: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            color: kPrimaryColor,
          ),
          child: Text(
            messages.Message,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessageForFriend extends StatelessWidget {
  const ChatMessageForFriend({
    super.key,
    required this.messages,
  });
  final MessageModel messages;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding:const  EdgeInsets.all(16).copyWith(left: 8),
          decoration:const  BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            color:  Color.fromARGB(255, 33, 145, 236),
          ),
          child: Text(
            messages.Message,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
