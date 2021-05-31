// To parse this JSON data, do
//
//     final pakcageslListModel = pakcageslListModelFromJson(jsonString);

import 'dart:convert';

PakcageslListModel pakcageslListModelFromJson(String str) => PakcageslListModel.fromJson(json.decode(str));

String pakcageslListModelToJson(PakcageslListModel data) => json.encode(data.toJson());

class PakcageslListModel {
    PakcageslListModel({
        this.success,
        this.code,
        this.packages,
    });

    bool success;
    int code;
    List<Package> packages;

    factory PakcageslListModel.fromJson(Map<String, dynamic> json) => PakcageslListModel(
        success: json["success"],
        code: json["code"],
        packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
    };
}

class Package {
    Package({
        this.id,
        this.title,
        this.price,
        this.target,
        this.features,
    });

    int id;
    String title;
    int price;
    int target;
    List<String> features;

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        target: json["target"],
        features: List<String>.from(json["features"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "target": target,
        "features": List<dynamic>.from(features.map((x) => x)),
    };
}
