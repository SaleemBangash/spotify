class CSearchModel {
  String id;
  String interest_id;
  String user_id;

  String community_name;
  String created_at;
  String updated_at;

  CSearchModel(
      {required this.id,
      required this.interest_id,
      required this.user_id,
      required this.community_name,
      required this.created_at,
      required this.updated_at});
}
