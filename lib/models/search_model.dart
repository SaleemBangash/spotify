class SearchModel {
  String id;
  String name;
  String userName;
  String email;
  String email_verified_at;
  String image;
  String bio;
  String created_at;
  String updated_at;

  SearchModel(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      required this.email_verified_at,
      required this.image,
      required this.bio,
      required this.created_at,
      required this.updated_at});
}
