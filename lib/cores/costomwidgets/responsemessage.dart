import 'package:chatapp/cores/costomwidgets/chatmessage.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cores/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResponseMessages extends StatelessWidget {
  ResponseMessages({
    super.key,
    required this.email,
  });

  var email;
  static ScrollController scrollController = ScrollController();
  Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
      .collection(KMessageCollection)
      .orderBy('createdAt', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder<QuerySnapshot>(
          
      stream: collectionStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messageslist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageslist.add(
              MessageModel.FromJeson(snapshot.data!.docs[i]),
            );
          }
          return ListView.builder(
              reverse: true,
              controller: scrollController,
              itemCount: messageslist.length,
              itemBuilder: (context, index) => messageslist[index].id == email
                  ? ChatMessage(
                      messages: messageslist[index],
                    )
                  : ChatMessageForFriend(messages: messageslist[index]));
        } else if (snapshot.hasError) {
          return Dialog(
            child: AlertDialog( 
              
              backgroundColor: Colors.black,
              title: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.exit_to_app_outlined),
              ),
              content: Text(
                'sorry there was an error',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Colors.black12,
              ),
            ),
          );
        }
      },
    ));
  }
}
