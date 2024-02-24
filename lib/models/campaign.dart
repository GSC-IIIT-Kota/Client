class Donor {
  final String donorID;
  final String transactionID;

  Donor({
    required this.donorID,
    required this.transactionID,
  });

  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      donorID: json['donorID'] ?? '',
      transactionID: json['transactionID'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donorID': donorID,
      'transactionID': transactionID,
    };
  }
}

class Campaign {
  final String id;
  final String ngoID;
  final String title;
  final String description;
  final DateTime endDate;
  final String imageUrl;
  final double raisedMoney;
  final double totalGoal;
  final List<Donor> donors;

  Campaign({
    required this.id,
    required this.ngoID,
    required this.title,
    required this.description,
    required this.endDate,
    required this.imageUrl,
    required this.raisedMoney,
    required this.totalGoal,
    required this.donors,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    List<Donor> donors = [];
    if (json['donors'] != null) {
      donors = List<Donor>.from((json['donors'] as List<dynamic>).map((x) => Donor.fromJson(x)));
    }

    DateTime? endDate;
    if (json['endDate'] != null) {
      try {
        endDate = DateTime.parse(json['endDate']);
      } catch (e) {
        print('Invalid date format for EndDate: ${json['endDate']}');
      }
    }

    return Campaign(
      id: json['id'] ?? '',
      ngoID: json['ngoID'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      endDate: endDate ?? DateTime.now(),
      imageUrl: json['imageUrl'] ?? '',
      raisedMoney: (json['raisedMoney'] as num?)?.toDouble() ?? 0.0,
      totalGoal: (json['totalGoal'] as num?)?.toDouble() ?? 0.0,
      donors: donors,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ngoID': ngoID,
      'title': title,
      'description': description,
      'endDate': endDate.toIso8601String(),
      'imageUrl': imageUrl,
      'raisedMoney': raisedMoney,
      'totalGoal': totalGoal,
      'donors': donors.map((donor) => donor.toJson()).toList(),
    };
  }
}
