class UsersModel {
  String id;
  String fullName;
  String email;
  String phoneNumber;
  String password;
  dynamic profilePhoto;
  String designation;
  dynamic referralCode;
  bool agreeTerms;
  String role;
  int? otp;
  DateTime otpExpireTime;
  bool isEmailVerified;
  bool isDeleted;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;

  UsersModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.profilePhoto,
    required this.designation,
    this.referralCode,
    required this.agreeTerms,
    required this.role,
    required this.otp,
    required this.otpExpireTime,
    required this.isEmailVerified,
    required this.isDeleted,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],
    profilePhoto: json["profilePhoto"],
    designation: json["designation"],
    referralCode: json["referralCode"],
    agreeTerms: json["agreeTerms"],
    role: json["role"],
    otp: json["otp"],
    otpExpireTime: DateTime.parse(json["otpExpireTime"]),
    isEmailVerified: json["isEmailVerified"],
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "email": email,
    "phoneNumber": phoneNumber,
    "password": password,
    "profilePhoto": profilePhoto,
    "designation": designation,
    "referralCode": referralCode,
    "agreeTerms": agreeTerms,
    "role": role,
    "otp": otp,
    "otpExpireTime": otpExpireTime.toIso8601String(),
    "isEmailVerified": isEmailVerified,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
