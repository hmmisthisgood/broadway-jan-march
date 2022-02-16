class Post {
  final int id;

  final String userImage;
  final String username;
  final String postImage;
  final int likeCount;
  final int commenCount;
  final String shareLink;
  final String caption;
  final List comments;

  Post(
      {required this.id,
      required this.userImage,
      required this.username,
      required this.postImage,
      required this.likeCount,
      required this.commenCount,
      required this.shareLink,
      required this.caption,
      required this.comments});
}
