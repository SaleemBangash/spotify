class ChatModel {
  String con_number;
  String send_id;
  String reciever_id;

  String status;
  String name;
  String image;

  ChatModel(
      {required this.con_number,
      required this.send_id,
      required this.reciever_id,
      required this.status,
      required this.name,
      required this.image});
}
