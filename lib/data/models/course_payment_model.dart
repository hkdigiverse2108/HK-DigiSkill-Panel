class CoursePurchaseModel {
  final String? id;
  final CoursePurchaseUserModel? user;
  final CoursePurchaseCourseModel? course;
  final String? paymentStatus;
  final String? razorpayOrderId;
  final String? razorpayPaymentId;
  final bool? isDeleted;
  final String? purchaseDate;
  final String? createdAt;
  final String? updatedAt;

  CoursePurchaseModel({
    this.id,
    this.user,
    this.course,
    this.paymentStatus,
    this.razorpayOrderId,
    this.razorpayPaymentId,
    this.isDeleted,
    this.purchaseDate,
    this.createdAt,
    this.updatedAt,
  });

  factory CoursePurchaseModel.fromJson(Map<String, dynamic> json) {
    return CoursePurchaseModel(
      id: json["_id"],
      user: json["userId"] != null
          ? CoursePurchaseUserModel.fromJson(json["userId"])
          : null,
      course: json["courseId"] != null
          ? CoursePurchaseCourseModel.fromJson(json["courseId"])
          : null,
      paymentStatus: json["paymentStatus"],
      razorpayOrderId: json["razorpayOrderId"],
      razorpayPaymentId: json["razorpayPaymentId"],
      isDeleted: json["isDeleted"],
      purchaseDate: json["purchaseDate"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "userId": user?.toJson(),
      "courseId": course?.toJson(),
      "paymentStatus": paymentStatus,
      "razorpayOrderId": razorpayOrderId,
      "razorpayPaymentId": razorpayPaymentId,
      "isDeleted": isDeleted,
      "purchaseDate": purchaseDate,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}

class CoursePurchaseUserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? profilePhoto;
  final String? designation;

  CoursePurchaseUserModel({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.profilePhoto,
    this.designation,
  });

  factory CoursePurchaseUserModel.fromJson(Map<String, dynamic> json) {
    return CoursePurchaseUserModel(
      id: json["_id"],
      fullName: json['fullName'],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      profilePhoto: json["profilePhoto"],
      designation: json["designation"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
      "profilePhoto": profilePhoto,
      "designation": designation,
    };
  }
}

class CoursePurchaseCourseModel {
  final String? id;
  final String? name;
  final String? description;
  final num? price;
  final String? image;
  final num? enrolledLearners;
  final num? classCompleted;
  final num? satisfactionRate;

  CoursePurchaseCourseModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.enrolledLearners,
    this.classCompleted,
    this.satisfactionRate,
  });

  factory CoursePurchaseCourseModel.fromJson(Map<String, dynamic> json) {
    return CoursePurchaseCourseModel(
      id: json["_id"],
      name: json['name'],
      description: json["description"],
      price: json["price"],
      image: json["image"],
      enrolledLearners: json["enrolledLearners"],
      classCompleted: json["classCompleted"],
      satisfactionRate: json["satisfactionRate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "description": description,
      "price": price,
      "image": image,
      "enrolledLearners": enrolledLearners,
      "classCompleted": classCompleted,
      "satisfactionRate": satisfactionRate,
    };
  }
}
