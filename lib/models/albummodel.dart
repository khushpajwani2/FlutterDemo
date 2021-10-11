class Album {
  // final int userId;
  final String token;

  // final int id;
  // final String title;

  Album({
    required this.token,
    // required this.userId,
    // required this.id,
    // required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      token: json['token'],
      // userId: json['userId'],
      /*id: json['id'],
      title: json['title'],*/
    );
  }
}
