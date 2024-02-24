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
}

class Campaign {
  final String id;
  final String ngoID;
  final String title;
  final String description;
  final String imageUrl;
  final int raisedMoney;
  final int totalGoal;
  final List<Donor> donors;

  Campaign({
    required this.id,
    required this.ngoID,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.raisedMoney,
    required this.totalGoal,
    required this.donors,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    List<Donor> donors = [];
    if (json['donors'] != null) {
      donors = List<Donor>.from(json['donors'].map((x) => Donor.fromJson(x)));
    }

    return Campaign(
      id: json['id'] ?? '',
      ngoID: json['ngoID'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      raisedMoney: json['raisedMoney'] ?? 0,
      totalGoal: json['totalGoal'] ?? 0,
      donors: donors,
    );
  }

}
