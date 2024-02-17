class NGOProfile {
  final String registrationNumber;
  final String ngoName;
  final String worksFor;
  final String address;
  final String pincode;
  final String city;
  final String state;
  final String country;
  final String phoneNumber;
  final String description;
  final String logo;

  NGOProfile({
    required this.registrationNumber,
    required this.ngoName,
    required this.worksFor,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
    required this.country,
    required this.phoneNumber,
    required this.description,
    required this.logo,
  });

  factory NGOProfile.fromJson(Map<String, dynamic> json) {
    return NGOProfile(
      registrationNumber: json['registrationNumber'],
      ngoName: json['ngoName'],
      worksFor: json['worksFor'],
      address: json['address'],
      pincode: json['pincode'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      phoneNumber: json['phoneNumber'],
      description: json['description'],
      logo: json['logo'],
    );
  }
}

class NGO {
  final String id;
  final String email;
  final String passwordHash;
  final NGOProfile? profile; // Make it nullable
  final List<String>? campaigns; // Make it nullable
  final List<String>? events; // Make it nullable

  NGO({
    required this.id,
    required this.email,
    required this.passwordHash,
    this.profile, // Update here
    this.campaigns, // Update here
    this.events, // Update here
  });

  factory NGO.fromJson(Map<String, dynamic> json) {
    return NGO(
      id: json['id'],
      email: json['email'],
      passwordHash: json['password'],
      profile: json['profile'] != null ? NGOProfile.fromJson(json['profile']) : null, // Handle null case
      campaigns: json['campaigns'] != null ? List<String>.from(json['campaigns']) : null, // Handle null case
      events: json['events'] != null ? List<String>.from(json['events']) : null, // Handle null case
    );
  }
}
