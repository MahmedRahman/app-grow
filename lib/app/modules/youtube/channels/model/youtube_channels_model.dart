// To parse this JSON data, do
//
//     final channelListModel = channelListModelFromJson(jsonString);

import 'dart:convert';

ChannelListModel channelListModelFromJson(String str) =>
    ChannelListModel.fromJson(json.decode(str));

String channelListModelToJson(ChannelListModel data) =>
    json.encode(data.toJson());

class ChannelListModel {
  ChannelListModel({
    this.success,
    this.code,
    this.data,
  });

  bool success;
  int code;
  List<Datum> data;

  factory ChannelListModel.fromJson(Map<String, dynamic> json) =>
      ChannelListModel(
        success: json["success"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "data": List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Datum {
  Datum({
    this.channelId,
    this.channelUrl,
    this.videos,
    this.views,
    this.subscriberCount,
    this.title,
    this.banner,
    this.logo,
    this.registered,
  });

  String channelId;
  String channelUrl;
  String videos;
  String views;
  String subscriberCount;
  String title;
  String banner;
  String logo;
  bool registered;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        channelId: json["channel_id"],
        channelUrl: json["channel_url"],
        videos: json["videos"],
        views: json["views"],
        subscriberCount: json["subscriberCount"],
        title: json["title"],
        banner: json["banner"],
        logo: json["logo"],
        registered: json["registered"],
      );

  Map<String, dynamic> toJson() => {
        "channel_id": channelId,
        "channel_url": channelUrl,
        "videos": videos,
        "views": views,
        "subscriberCount": subscriberCount,
        "title": title,
        "banner": banner,
        "logo": logo,
        "registered": registered,
      };
}
