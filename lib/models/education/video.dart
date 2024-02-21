class Video {
  final String id;
  final String title;
  final String uploader;
  final DateTime uploadDate;
  final String description;
  final List<String> tags;
  final String category;
  final String thumbnailUrl;
  final List<Comment> comments;
  final int likes;
  final String transcripts;

  Video({
    required this.id,
    required this.title,
    required this.uploader,
    required this.uploadDate,
    required this.description,
    required this.tags,
    required this.category,
    required this.thumbnailUrl,
    required this.comments,
    required this.likes,
    required this.transcripts,
  });

  factory Video.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError.notNull('json');
    }

    return Video(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      uploader: json['uploader'] as String? ?? '',
      uploadDate: DateTime.parse(json['uploadDate'] as String? ?? ''),
      description: json['description'] as String? ?? '',
      tags: List<String>.from(json['tags'] as List<dynamic>? ?? []),
      category: json['category'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
      comments: (json['comments'] as List<dynamic>?)
          ?.map((comment) => Comment.fromJson(comment))
          .toList() ??
          [],
      likes: json['likes'] as int? ?? 0,
      transcripts: json['transcripts'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'uploader': uploader,
      'uploadDate': uploadDate.toIso8601String(),
      'description': description,
      'tags': tags,
      'category': category,
      'thumbnailUrl': thumbnailUrl,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'likes': likes,
      'transcripts': transcripts,
    };
  }
}

class Comment {
  final String id;
  final String text;
  final String commenter;
  final DateTime commentDate;

  Comment({
    required this.id,
    required this.text,
    required this.commenter,
    required this.commentDate,
  });

  factory Comment.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError.notNull('json');
    }

    return Comment(
      id: json['id'] as String? ?? '',
      text: json['text'] as String? ?? '',
      commenter: json['commenter'] as String? ?? '',
      commentDate: DateTime.parse(json['commentDate'] as String? ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'commenter': commenter,
      'commentDate': commentDate.toIso8601String(),
    };
  }
}
