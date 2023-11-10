class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String gender;
  String avatar;
  String domain;
  bool available;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.avatar,
    required this.domain,
    required this.available,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      avatar: json['avatar'],
      domain: json['domain'],
      available: json['available'],
    );
  }
}