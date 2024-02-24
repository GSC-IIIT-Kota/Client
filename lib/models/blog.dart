class Blog {
  final String ?id;
  final String title;
  final String content;
  final String authorName;
  final String image;
  final String category;
  final String authorID;
  final DateTime ?date;

  Blog({
    this.id,
    required this.title,
    required this.content,
    required this.authorName,
    required this.image,
    required this.category,
    required this.authorID,
    this.date,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      authorName: json['authorName'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      authorID: json['authorID'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'authorID': authorID,
      'authorName': authorName,
      'image': image,
      'category': category,
      'date': date?.toIso8601String(),
    };
  }
}
