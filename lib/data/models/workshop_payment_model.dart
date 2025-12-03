class WorkshopPaymentModel {
  String id;
  WorkshopInfo workshop;
  UserInfo user;
  double amount;
  double discountAmount;
  double finalAmount;
  String paymentStatus;
  String paymentMethod;
  String paymentId;
  DateTime transactionDate;

  WorkshopPaymentModel({
    required this.id,
    required this.workshop,
    required this.user,
    required this.amount,
    required this.discountAmount,
    required this.finalAmount,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.paymentId,
    required this.transactionDate,
  });

  factory WorkshopPaymentModel.fromJson(Map<String, dynamic> json) =>
      WorkshopPaymentModel(
        id: json["_id"],
        workshop: WorkshopInfo.fromJson(json["workshopId"]),
        user: UserInfo.fromJson(json["userId"]),
        amount: json["amount"].toDouble(),
        discountAmount: json["discountAmount"].toDouble(),
        finalAmount: json["finalAmount"].toDouble(),
        paymentStatus: json["paymentStatus"],
        paymentMethod: json["paymentMethod"],
        paymentId: json["paymentId"],
        transactionDate: DateTime.parse(json["transactionDate"]),
      );
}

class WorkshopInfo {
  String id;
  String title;
  double price;

  WorkshopInfo({required this.id, required this.title, required this.price});

  factory WorkshopInfo.fromJson(Map<String, dynamic> json) => WorkshopInfo(
    id: json["_id"],
    title: json["title"],
    price: json["price"].toDouble(),
  );
}

class UserInfo {
  String id;
  String name;
  String email;

  UserInfo({required this.id, required this.name, required this.email});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      UserInfo(id: json["_id"], name: json["fullName"], email: json["email"]);
}
