import 'dart:convert';

class Viedo {
  bool success;
  int code;
  List<viedoItem> data;

  Viedo({
    this.success,
    this.code,
    this.data,
  });

  factory Viedo.fromJson(Map<String, dynamic> json) => Viedo(
        code: json["code"],
        data: List<viedoItem>.from(
          json["data"].map((x) => viedoItem.fromjson(x)),
        ),
        success: json["success"],
      );
}

class viedoItem {
  String id;
  String published_at;
  String title;
  String description;
  String thumbnails;
  int duration;

  viedoItem(
      {this.id,
      this.published_at,
      this.title,
      this.thumbnails,
      this.description,
      this.duration});

  factory viedoItem.fromjson(Map<String, dynamic> json) => viedoItem(
        description: json['description'],
        duration: json['duration'],
        id: json['id'],
        published_at: json['published_at'],
        thumbnails: json['thumbnails'],
        title: json['title'],
      );
}
