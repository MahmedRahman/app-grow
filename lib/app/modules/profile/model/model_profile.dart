// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    Data data;
    int code;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "code": code,
    };
}

class Data {
    Data({
        this.info,
        this.balance,
        this.channels,
    });

    Info info;
    List<Balance> balance;
    List<Channel> channels;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        info: Info.fromJson(json["info"]),
        balance: List<Balance>.from(json["balance"].map((x) => Balance.fromJson(x))),
        channels: List<Channel>.from(json["channels"].map((x) => Channel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "balance": List<dynamic>.from(balance.map((x) => x.toJson())),
        "channels": List<dynamic>.from(channels.map((x) => x.toJson())),
    };
}

class Balance {
    Balance({
        this.date,
        this.amount,
        this.channel,
    });

    DateTime date;
    String amount;
    Channel channel;

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        date: DateTime.parse(json["date"]),
        amount: json["amount"],
        channel: Channel.fromJson(json["channel"]),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "channel": channel.toJson(),
    };
}

class Channel {
    Channel({
        this.channelId,
        this.channelUrl,
        this.videos,
        this.views,
        this.subscriberCount,
        this.title,
        this.banner,
        this.logo,
        this.subscribtionStatus,
        this.appSubscribers,
        this.subscribersData,
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
    int appSubscribers;
    List<SubscribersDatum> subscribersData;

    factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        channelId: json["channel_id"],
        channelUrl: json["channel_url"],
        videos: json["videos"],
        views: json["views"],
        subscriberCount: json["subscriberCount"],
        title: json["title"],
        banner: json["banner"] == null ? null : json["banner"],
        logo: json["logo"],
        subscribtionStatus: json["subscribtion_status"] == null ? null : json["subscribtion_status"],
        appSubscribers: json["app_subscribers"] == null ? null : json["app_subscribers"],
        subscribersData: json["subscribers_data"] == null ? null : List<SubscribersDatum>.from(json["subscribers_data"].map((x) => SubscribersDatum.fromJson(x))),
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
        "subscribtion_status": subscribtionStatus == null ? null : subscribtionStatus,
        "app_subscribers": appSubscribers == null ? null : appSubscribers,
        "subscribers_data": subscribersData == null ? null : List<dynamic>.from(subscribersData.map((x) => x.toJson())),
    };
}

class SubscribersDatum {
    SubscribersDatum({
        this.id,
        this.name,
        this.email,
        this.avatar,
    });

    int id;
    String name;
    String email;
    String avatar;

    factory SubscribersDatum.fromJson(Map<String, dynamic> json) => SubscribersDatum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
    };
}

class Info {
    Info({
        this.name,
        this.email,
        this.avatar,
        this.channelsCount,
        this.subscribers,
        this.subscribtions,
        this.balance,
    });

    String name;
    String email;
    String avatar;
    int channelsCount;
    int subscribers;
    int subscribtions;
    String balance;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        channelsCount: json["channels_count"],
        subscribers: json["subscribers"],
        subscribtions: json["subscribtions"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "avatar": avatar,
        "channels_count": channelsCount,
        "subscribers": subscribers,
        "subscribtions": subscribtions,
        "balance": balance,
    };
}
