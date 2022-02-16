class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  static const someVaraible = "some value";

  static List<Post> fromList(List listData) {
    List<Post> posts = listData.map((e) {
      ///
      final newPost = Post.fromJson(e);
      return newPost;
    }).toList();
    return posts;
  }
}
