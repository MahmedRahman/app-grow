// To parse this JSON data, do
//
//     final channelsListModel = channelsListModelFromJson(jsonString);

import 'dart:convert';

ChannelsListModel channelsListModelFromJson(String str) => ChannelsListModel.fromJson(json.decode(str));

String channelsListModelToJson(ChannelsListModel data) => json.encode(data.toJson());

class ChannelsListModel {
    ChannelsListModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    List<Datum> data;

    factory ChannelsListModel.fromJson(Map<String, dynamic> json) => ChannelsListModel(
        success: json["success"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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
        this.subscribtionStatus,
    });

    String channelId;
    String channelUrl;
    String videos;
    String views;
    String subscriberCount;
    String title;
    String banner;
    String logo;
    bool subscribtionStatus;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        channelId: json["channel_id"],
        channelUrl: json["channel_url"],
        videos: json["videos"],
        views: json["views"],
        subscriberCount: json["subscriberCount"],
        title: json["title"],
        banner: json["banner"] == null ? null : json["banner"],
        logo: json["logo"],
        subscribtionStatus: json["subscribtion_status"],
    );

    Map<String, dynamic> toJson() => {
        "channel_id": channelId,
        "channel_url": channelUrl,
        "videos": videos,
        "views": views,
        "subscriberCount": subscriberCount,
        "title": title,
        "banner": banner == null ? null : banner,
        "logo": logo,
        "subscribtion_status": subscribtionStatus,
    };
}
