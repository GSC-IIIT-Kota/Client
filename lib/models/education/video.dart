class Video {
  final String id;
  final String title;
  final String videoUrl;
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
    required this.videoUrl,
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
      videoUrl: json['videoUrl'] as String? ?? '',
      uploader: json['uploader'] as String? ?? '',
      uploadDate: DateTime.tryParse(json['uploadDate'] as String? ?? '') ?? DateTime.now(),
      description: json['description'] as String? ?? '',
      tags: (json['tags'] as List<dynamic>?)?.map((tag) => tag.toString()).toList() ?? [],
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
      'videoUrl': videoUrl,
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
  final String? id;
  final String userid;
  final String content;
  final DateTime? commentDate;

  Comment({
    this.id,
    required this.userid,
    required this.content,
    this.commentDate,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['commentID'] as String?,
      userid: json['userID'] as String,
      content: json['content'] as String,
      commentDate: json['commented'] != null
          ? DateTime.parse(json['commented'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentID': id,
      'userID': userid,
      'content': content,
      'commented': commentDate != null ? commentDate!.toIso8601String() : null,
    };
  }
}
