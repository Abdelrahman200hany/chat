import 'package:chatapp/cores/costomwidgets/responsemessage.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CostomtextfieldChat extends StatelessWidget {
  CostomtextfieldChat({super.key, required this.Email});
  var Email;


  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessageCollection);
  TextEditingController controller = TextEditingController();
  final scrollController = ResponseMessages.scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onSubmitted: (value) {
          messages.add({
            'message': value,
            "createdAt": DateTime.now(),
            'id': Email,
          });
          controller.clear();
          scrollController.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
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
                    messages.add({
                      "message": messageText,
                      // to add the time of sent message to use it after
                      "createdAt": DateTime.now(),
                      // to add email to the message to can  use it after
                      'id': Email,
                    });
                    // to clear the text in text form
                    controller.clear();
                    scrollController.animateTo(0,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  }
                },
                icon: Icon(
                  Icons.send,
                  color: KPrimaryColor,
                ),
              ),
            ),
            hintText: 'أرسال ',
            hintStyle: TextStyle(color: KPrimaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: KPrimaryColor,
                ))),
      ),
    );
  }
}
