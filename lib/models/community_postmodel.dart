class CommunityPostModel {
  String id;
  String userID;
  String postImage;
  String description;
  String date;
  String time;
  String likes;
  String comments;
  String name;
  String image;
  bool? like = false;

  CommunityPostModel({
    required this.id,
    required this.userID,
    required this.postImage,
    required this.description,
    required this.date,
    required this.time,
    required this.likes,
    required this.comments,
    required this.name,
    required this.image,
    this.like,
  });
}
