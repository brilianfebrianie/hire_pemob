class User {
  String uid;
  String? profileURL;
  String name;
  String email;
  String phoneNumber;
  String birthPlace;
  String birthDate;
  String profession;
  String address;

  User(
      {required this.uid,
      required this.profileURL,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.birthPlace,
      required this.birthDate,
      required this.profession,
      required this.address});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "profileURL": profileURL ??
            'https://firebasestorage.googleapis.com/v0/b/build-hire.appspot.com/o/blank-profile-picture-973460__480.webp?alt=media&token=4a067a06-2e54-415c-a0ad-5adfb5d5d1a2',
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "birthPlace": birthPlace,
        "birthDate": birthDate,
        "profession": profession,
        "address": address
      };

  static User fromJson(Map<String, dynamic> json) => User(
      uid: json['uid'],
      profileURL: json['profileURL'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      birthPlace: json['birthPlace'],
      birthDate: json['birthDate'],
      profession: json['profession'],
      address: json['address']);
}
