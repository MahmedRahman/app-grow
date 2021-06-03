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
        this.videos,
    });

    Info info;
    List<Balance> balance;
    List<ChannelElement> channels;
    List<VideoElement> videos;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        info: Info.fromJson(json["info"]),
        balance: List<Balance>.from(json["balance"].map((x) => Balance.fromJson(x))),
        channels: List<ChannelElement>.from(json["channels"].map((x) => ChannelElement.fromJson(x))),
        videos: List<VideoElement>.from(json["videos"].map((x) => VideoElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "balance": List<dynamic>.from(balance.map((x) => x.toJson())),
        "channels": List<dynamic>.from(channels.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
    };
}

class Balance {
    Balance({
        this.date,
        this.amount,
        this.channel,
        this.video,
    });

    DateTime date;
    String amount;
    dynamic channel;
    dynamic video;

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        date: DateTime.parse(json["date"]),
        amount: json["amount"],
        channel: json["channel"],
        video: json["video"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "channel": channel,
        "video": video,
    };
}

class ChannelElement {
    ChannelElement({
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

    factory ChannelElement.fromJson(Map<String, dynamic> json) => ChannelElement(
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

class VideoElement {
    VideoElement({
        this.id,
        this.publishedAt,
        this.title,
        this.description,
        this.thumbnails,
        this.duration,
        this.youtubeStatistics,
        this.appViewers,
    });

    String id;
    DateTime publishedAt;
    String title;
    String description;
    String thumbnails;
    int duration;
    YoutubeStatistics youtubeStatistics;
    int appViewers;

    factory VideoElement.fromJson(Map<String, dynamic> json) => VideoElement(
        id: json["id"],
        publishedAt: DateTime.parse(json["published_at"]),
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"],
        duration: json["duration"],
        youtubeStatistics: YoutubeStatistics.fromJson(json["youtube_statistics"]),
        appViewers: json["app_viewers"] == null ? null : json["app_viewers"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "published_at": publishedAt.toIso8601String(),
        "title": title,
        "description": description,
        "thumbnails": thumbnails,
        "duration": duration,
        "youtube_statistics": youtubeStatistics.toJson(),
        "app_viewers": appViewers == null ? null : appViewers,
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

class Info {
    Info({
        this.name,
        this.email,
        this.avatar,
        this.channelsCount,
        this.videosCount,
        this.subscribers,
        this.subscribtions,
        this.viewers,
        this.views,
        this.balance,
    });

    String name;
    String email;
    String avatar;
    int channelsCount;
    int videosCount;
    int subscribers;
    int subscribtions;
    int viewers;
    int views;
    String balance;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        channelsCount: json["channels_count"],
        videosCount: json["videos_count"],
        subscribers: json["subscribers"],
        subscribtions: json["subscribtions"],
        viewers: json["viewers"],
        views: json["views"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "avatar": avatar,
        "channels_count": channelsCount,
        "videos_count": videosCount,
        "subscribers": subscribers,
        "subscribtions": subscribtions,
        "viewers": viewers,
        "views": views,
        "balance": balance,
    };
}
