import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? fullName;
  String? fcmId;
  String? email;
  String? gender;
  String? phoneNo;
  int? status;
  String? role;
  String? image;
  Timestamp? createdAt;
  Timestamp? dob;
  UserData(
      {this.fullName,
      this.email,
      this.phoneNo,
      this.gender,
      this.status,
      this.fcmId,
      this.image,
      this.createdAt,
      this.dob,
      this.role});
  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "dob": dob,
      "gender": gender,
      "fcm_id": fcmId,
      "email": email,
      "phoneNo": phoneNo,
      "status": status,
      "role": role,
      "image": image,
      "createdAt": createdAt,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      fullName: json["fullName"],
      dob: json["dob"],
      gender: json["gender"],
      fcmId: json["fcm_id"],
      email: json["email"],
      phoneNo: json["phoneNo"],
      status: json["status"],
      role: json["role"],
      createdAt: json["createdAt"],
      image: json["image"],
    );
  }
}
