class Blog {
  final String id;
  final String title;
  final String content;
  final String author;
  final String image;
  final String category;
  final DateTime? date; // Nullable DateTime

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.image,
    required this.category,
    this.date,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
      date: json['date'] != null ? DateTime.parse(json['date'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author,
      'image': image,
      'category': category,
      'date': date != null ? date!.toIso8601String() : null,
    };
  }
}
