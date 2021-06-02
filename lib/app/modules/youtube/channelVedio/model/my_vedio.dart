// To parse this JSON data, do
//
//     final myVideoModel = myVideoModelFromJson(jsonString);

import 'dart:convert';

MyVideoModel myVideoModelFromJson(String str) => MyVideoModel.fromJson(json.decode(str));

String myVideoModelToJson(MyVideoModel data) => json.encode(data.toJson());

class MyVideoModel {
    MyVideoModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    List<Datum> data;
    int code;

    factory MyVideoModel.fromJson(Map<String, dynamic> json) => MyVideoModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
    };
}

class Datum {
    Datum({
        this.id,
        this.publishedAt,
        this.title,
        this.description,
        this.thumbnails,
        this.duration,
        this.youtubeStatistics,
        this.registered,
    });

    String id;
    DateTime publishedAt;
    String title;
    String description;
    String thumbnails;
    int duration;
    YoutubeStatistics youtubeStatistics;
    bool registered;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        publishedAt: DateTime.parse(json["published_at"]),
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"],
        duration: json["duration"],
        youtubeStatistics: YoutubeStatistics.fromJson(json["youtube_statistics"]),
        registered: json["registered"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "published_at": publishedAt.toIso8601String(),
        "title": title,
        "description": description,
        "thumbnails": thumbnails,
        "duration": duration,
        "youtube_statistics": youtubeStatistics.toJson(),
        "registered": registered,
    };
}

class YoutubeStatistics {
    YoutubeStatistics({
        this.viewCount,
        this.likeCount,
        this.dislikeCount,
        this.favoriteCount,
        this.commentCount,
    });

    String viewCount;
    String likeCount;
    String dislikeCount;
    String favoriteCount;
    String commentCount;

    factory YoutubeStatistics.fromJson(Map<String, dynamic> json) => YoutubeStatistics(
        viewCount: json["viewCount"],
        likeCount: json["likeCount"],
        dislikeCount: json["dislikeCount"],
        favoriteCount: json["favoriteCount"],
        commentCount: json["commentCount"],
    );

    Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "dislikeCount": dislikeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
    };
}
