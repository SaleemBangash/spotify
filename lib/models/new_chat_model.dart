class NewChatModel {
  String id;
  String send_id;
  String receiver_id;
  String message;
  String time;
  String status;
  String created_at;
  String updated_at;

  NewChatModel(
      {required this.id,
      required this.send_id,
      required this.receiver_id,
      required this.message,
      required this.time,
      required this.status,
      required this.created_at,
      required this.updated_at});
}
