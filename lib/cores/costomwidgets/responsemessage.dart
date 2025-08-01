import 'package:chatapp/cores/costomwidgets/chatmessage.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cores/message_model.dart';
import 'package:chatapp/cubit/chat/chat_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseMessages extends StatelessWidget {
  ResponseMessages({
    super.key,
    required this.email,
  });

  var email;
  static ScrollController scrollController = ScrollController();
  Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
      .collection(kMessageCollection)
      .orderBy('createdAt', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        List<MessageModel> messageList =
            BlocProvider.of<ChatCubit>(context).messageslist;
        return ListView.builder(
            reverse: true,
            controller: scrollController,
            itemCount: messageList.length,
            itemBuilder: (context, index) => messageList[index].id == email
                ? ChatMessage(
                    messages: messageList[index],
                  )
                : ChatMessageForFriend(messages: messageList[index]));
      },
    ));
  }
}
