// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
    PaymentModel({
        this.success,
        this.code,
        this.subscribtions,
    });

    bool success;
    int code;
    List<Subscribtion> subscribtions;

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        success: json["success"],
        code: json["code"],
        subscribtions: List<Subscribtion>.from(json["subscribtions"].map((x) => Subscribtion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "subscribtions": List<dynamic>.from(subscribtions.map((x) => x.toJson())),
    };
}

class Subscribtion {
    Subscribtion({
        this.id,
        this.package,
        this.status,
        this.subscribers,
        this.views,
        this.price,
        this.date,
    });

    int id;
    String package;
    String status;
    String subscribers;
    String views;
    int price;
    DateTime date;

    factory Subscribtion.fromJson(Map<String, dynamic> json) => Subscribtion(
        id: json["id"],
        package: json["package"],
        status: json["status"],
        subscribers: json["subscribers"] ,
        views: json["views"] ,
        price: json["price"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "package": package,
        "status": status,
        "subscribers": subscribers == null ? null : subscribers,
        "views": views == null ? null : views,
        "price": price,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}
