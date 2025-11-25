import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class CouponCodeModel {
  String id;
  String title;
  String code;
  CouponType discountType;
  int discountValue;
  int minOrderAmount;
  int maxDiscountAmount;
  DateTime? startDate;
  DateTime? endDate;
  int? usageLimit;
  int? usedCount;
  String? appliesTo;
  List<dynamic>? specificIds;
  String? status;
  bool? isDeleted;
  bool? isBlocked;
  DateTime? createdAt;
  DateTime? updatedAt;

  CouponCodeModel({
    required this.id,
    required this.title,
    required this.code,
    required this.discountType,
    required this.discountValue,
    required this.minOrderAmount,
    required this.maxDiscountAmount,
    this.startDate,
    this.endDate,
    this.usageLimit,
    this.usedCount,
    this.appliesTo,
    this.specificIds,
    this.status,
    this.isDeleted,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
  });

  factory CouponCodeModel.fromJson(Map<String, dynamic> json) =>
      CouponCodeModel(
        id: json["_id"],
        title: json["title"],
        code: json["code"],
        discountType: json["discountType"] == null
            ? CouponType.amount
            : CouponCodeModelExtension.fromString(json["discountType"]),
        discountValue: json["discountValue"],
        minOrderAmount: json["minOrderAmount"],
        maxDiscountAmount: json["maxDiscountAmount"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null
            ? null
            : DateTime.parse(json["endDate"]),
        usageLimit: json["usageLimit"],
        usedCount: json["usedCount"],
        appliesTo: json["appliesTo"],
        specificIds: json["specificIds"] == null
            ? []
            : List<dynamic>.from(json["specificIds"]!.map((x) => x)),
        status: json["status"],
        isDeleted: json["isDeleted"],
        isBlocked: json["isBlocked"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "code": code,
    "discountType": discountType,
    "discountValue": discountValue,
    "minOrderAmount": minOrderAmount,
    "maxDiscountAmount": maxDiscountAmount,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "usageLimit": usageLimit,
    "usedCount": usedCount,
    "appliesTo": appliesTo,
    "specificIds": specificIds == null
        ? []
        : List<dynamic>.from(specificIds!.map((x) => x)),
    "status": status,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

extension CouponCodeModelExtension on CouponCodeModel {
  static CouponType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'percentage':
        return CouponType.percentage;
      case 'amount':
        return CouponType.amount;
      default:
        return CouponType.amount; // fallback
    }
  }
}
