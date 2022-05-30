class CommentModel {
  String id;
  String user_id;
  String comment;

  String date;
  String time;
  String name;
  String image;

  CommentModel(
      {required this.id,
      required this.user_id,
      required this.comment,
      required this.date,
      required this.time,
      required this.name,
      required this.image});
}
