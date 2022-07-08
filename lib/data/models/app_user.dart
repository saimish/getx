import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String? name;
  String? email;
  String? num;
  String? id;
  dynamic image;
  String? address;
  String? gender;
  Timestamp? dob;
  int? status;

  AppUser.fromJson(Map<String, dynamic> json)
      : name = json['fullName'],
        email = json['email'],
        num = json['phoneNo'],
        id = json['code'],
        image = json['image'],
        address = json['zip'],
        gender = json['gender'],
        dob = json['dob'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'fullName': name,
        'email': email,
        'phoneNo': num,
        'code': id,
        'image': image,
        'zip': address,
        'gender': gender,
        'dob': dob,
        'status': status,
      };

  AppUser({
    this.image,
    this.email = "",
    this.dob,
    this.name = "",
    this.num = "",
    this.gender = "",
    this.id = "",
    this.address,
  });
}
