class Blog {
  final String id;
  final String title;
  final String content;
  final int estimatedReadTime;
  final String authorID;
  final String authorName;
  final String image;
  final String category;
  final DateTime date;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.estimatedReadTime,
    required this.authorID,
    required this.authorName,
    required this.image,
    required this.category,
    required this.date,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      estimatedReadTime: json['estimatedReadTime'] as int,
      authorID: json['authorID'] as String,
      authorName: json['authorName'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'estimatedReadTime': estimatedReadTime,
      'authorID': authorID,
      'authorName': authorName,
      'image': image,
      'category': category,
      'date': date.toIso8601String(),
    };
  }
}
