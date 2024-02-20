// user.dart

class Donation {
  final String transactionID;
  final String campaignID;

  Donation({
    required this.transactionID,
    required this.campaignID,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      transactionID: json['transactionID'] ?? '',
      campaignID: json['campaignID'] ?? '',
    );
  }
}

class UserProfile {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String dob;
  final String profileImage;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dob,
    required this.profileImage,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      dob: json['dob'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

class User {
  final String id;
  final String email;
  final String passwordHash;
  final UserProfile profile;
  final List<Donation> donations;
  final List<String> myEvents;

  User({
    required this.id,
    required this.email,
    required this.passwordHash,
    required this.profile,
    required this.donations,
    required this.myEvents,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var userJson = json['user'] as Map<String,
        dynamic>?; // Get the 'user' object from the JSON
    if (userJson == null) {
      throw Exception('User data not found in JSON');
    }

    var donationList = userJson['donations'] as List<
        dynamic>?; // Add null check
    List<Donation> donations = donationList != null
        ? donationList.map((e) => Donation.fromJson(e)).toList()
        : [];

    var eventList = userJson['myEvents'] as List<dynamic>?; // Add null check
    List<String> myEvents = eventList != null
        ? eventList.map((e) => e.toString()).toList()
        : [];

    return User(
      id: userJson['id'] ?? '',
      email: userJson['email'] ?? '',
      passwordHash: userJson['password'] ?? '',
      profile: UserProfile.fromJson(userJson['profile'] ?? {}),
      donations: donations,
      myEvents: myEvents,
    );
  }
}
