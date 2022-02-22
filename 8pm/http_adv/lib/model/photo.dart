class Photo {
  Photo({
    required this.id,
    required this.pageUrl,
    required this.type,
    required this.tags,
    required this.previewUrl,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatUrl,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  final int id;
  final String pageUrl;
  final String type;
  final String tags;
  final String previewUrl;
  final int previewWidth;
  final int previewHeight;
  final String webformatUrl;
  final int webformatWidth;
  final int webformatHeight;
  final String largeImageUrl;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int collections;
  final int likes;
  final int comments;
  final int userId;
  final String user;
  final String userImageUrl;

  factory Photo.convertMapToPhoto(Map<String, dynamic> json) {
    return Photo(
      id: json["id"],
      pageUrl: json["pageURL"],
      type: json["type"],
      tags: json["tags"],
      previewUrl: json["previewURL"],
      previewWidth: json["previewWidth"],
      previewHeight: json["previewHeight"],
      webformatUrl: json["webformatURL"],
      webformatWidth: json["webformatWidth"],
      webformatHeight: json["webformatHeight"],
      largeImageUrl: json["largeImageURL"],
      imageWidth: json["imageWidth"],
      imageHeight: json["imageHeight"],
      imageSize: json["imageSize"],
      views: json["views"],
      downloads: json["downloads"],
      collections: json["collections"],
      likes: json["likes"],
      comments: json["comments"],
      userId: json["user_id"],
      user: json["user"],
      userImageUrl: json["userImageURL"],
    );
  }
}
