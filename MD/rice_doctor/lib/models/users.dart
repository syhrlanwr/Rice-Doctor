class Users {
  final String id;
  final String username;
  final String fullname;

  Users({
    required this.id,
    required this.username,
    required this.fullname,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['data']['user']['id'],
      username: json['data']['user']['username'],
      fullname: json['data']['user']['fullname'],
    );
  }
}
