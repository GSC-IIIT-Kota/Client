class Article {
  final String id;
  final String title;
  final String authorName;
  final DateTime uploadDate;
  final String content;
  final List<String> tags;
  final String category;
  final String thumbnailUrl;
  final List<Comment> comments;
  final int likes;

  Article({
    required this.id,
    required this.title,
    required this.authorName,
    required this.uploadDate,
    required this.content,
    required this.tags,
    required this.category,
    required this.thumbnailUrl,
    required this.comments,
    required this.likes,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      authorName: json['authorName'] ?? '',
      uploadDate: DateTime.parse(json['uploadDate'] ?? ''),
      content: json['content'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      category: json['category'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e))
              .toList() ??
          [],
      likes: json['likes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authorName': authorName,
      'uploadDate': uploadDate.toIso8601String(),
      'content': content,
      'tags': tags,
      'category': category,
      'thumbnailUrl': thumbnailUrl,
      'comments': comments.map((e) => e.toJson()).toList(),
      'likes': likes,
    };
  }
}

class Comment {
  final String commentID;
  final String userID;
  final String content;
  final DateTime commented;

  Comment({
    required this.commentID,
    required this.userID,
    required this.content,
    required this.commented,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentID: json['commentID'] ?? '',
      userID: json['userID'] ?? '',
      content: json['content'] ?? '',
      commented: DateTime.parse(json['commented'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentID': commentID,
      'userID': userID,
      'content': content,
      'commented': commented.toIso8601String(),
    };
  }
}
