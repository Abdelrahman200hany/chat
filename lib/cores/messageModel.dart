class MessageModel {
  final String Message;
  var id;
  MessageModel({required this.Message, required this.id});
  factory MessageModel.FromJeson(jeson) {
    return MessageModel(
      id: jeson['id'],
      Message: jeson['message'],
    );
  }
}
