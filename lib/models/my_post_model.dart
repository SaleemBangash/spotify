class MyPostModel {
  String id;
  String userID;
  String postImage;
  String description;
  String date;
  String time;
  String name;
  String image;
  bool? like = false;

  MyPostModel({
    required this.id,
    required this.userID,
    required this.postImage,
    required this.description,
    required this.date,
    required this.time,
    required this.name,
    required this.image,
    this.like,
  });
}
