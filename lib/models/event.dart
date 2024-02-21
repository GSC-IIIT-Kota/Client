class Event {
  final String id;
  final String title;
  final String date;
  final String day;
  final String time;
  final String location;
  final String description;
  final String banner;
  final String organizerId;
  final List<String>? participants;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.day,
    required this.time,
    required this.location,
    required this.description,
    required this.banner,
    required this.organizerId,
    this.participants,
  });

  factory Event.fromJson(Map<String, dynamic>? json) {
    return Event(
      id: json?['id'] ?? '',
      title: json?['title'] ?? '',
      date: json?['date'] ?? '',
      day: json?['day'] ?? '',
      time: json?['time'] ?? '',
      location: json?['location'] ?? '',
      description: json?['description'] ?? '',
      banner: json?['banner'] ?? '',
      organizerId: json?['organizerId'] ?? '',
      participants: json?['participants'] != null
          ? List<String>.from(json?['participants'] as List<dynamic>)
          : null,
    );
  }
}
