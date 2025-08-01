import 'package:bloc/bloc.dart';
import 'package:chatapp/cores/keys/keys.dart';
import 'package:chatapp/cores/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);
  List<MessageModel> messageslist = [];

  void sendMessage({required String message, required String email}) {
    messages.add({
      'message': message,
      "createdAt": DateTime.now(),
      'id': email,
    });

    
  }
  void getMessages() {
      messages.orderBy('createdAt', descending: true).snapshots().listen(
        (event) {
          messageslist.clear();
          for (var doc in event.docs) {
            messageslist.add(MessageModel.FromJeson(doc));
          }
          emit(ChatSuccess(messageslist: messageslist));
        },
      );
    }
}
