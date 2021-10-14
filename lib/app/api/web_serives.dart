import 'package:flutter/material.dart';
import 'package:grow/app/api/api_manger.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/data/app_constand.dart';

class WebServices extends APIManger {
  Future<ResponsModel> getGoogleLogin({
    String name,
    String email,
    String avatar,
  }) async {
    ResponsModel response = await repPost('google_login', body: {
      'refresh_token': KuserYoutubeTokan,
      'name': name,
      'email': email,
      'avatar': avatar
    });
    return response;
  }

  Future<ResponsModel> getChannelsList() async {
    ResponsModel response = await repPost('channels_list');
    return response;
  }

  Future<ResponsModel> getCategories() async {
    ResponsModel response = await repGet('categories');
    return response;
  }

  Future<ResponsModel> getCategoryDetailes({@required String id}) async {
    ResponsModel response = await repGet('category/$id');
    return response;
  }

  Future<ResponsModel> getChannelsVideoList() async {
    ResponsModel response = await repPost('channel_info');
    return response;
  }

  Future<ResponsModel> setChannelSubscribe(String channelID) async {
    ResponsModel response =
        await repPost('channel_subscribe/$channelID', showLoading: true);
    return response;
  }

  Future<ResponsModel> getShowPakcages() async {
    ResponsModel response = await repPost('packages', showLoading: true);
    return response;
  }

  Future<ResponsModel> getMyPackages() async {
    ResponsModel response = await repPost('my_packages');
    return response;
  }

  Future<ResponsModel> setPackageSubscribe(String Packagid) async {
    ResponsModel response = await repPost(
      'package_subscribe',
      body: {
        'package': Packagid,
      },
    );
    return response;
  }

  Future<ResponsModel> getMyChannels() async {
    ResponsModel response = await repPost('my_youtube_channels');
    return response;
  }

  Future<ResponsModel> getMyProfile() async {
    ResponsModel response = await repPost('profile');
    return response;
  }

  Future<ResponsModel> setRegisterChannel(String channelID) async {
    ResponsModel response = await repPost('register_channel',
        body: {
          'channel': channelID,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> setUnRegisterChannel(String channelID) async {
    ResponsModel response = await repPost(
      'unregister_channel',
      body: {
        'channel': channelID,
      },
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> getVideosList({String chanelID}) async {
    ResponsModel response =
        await repPost('my_videos/$chanelID', showLoading: true);
    return response;
  }

  Future<ResponsModel> setRegisterVideo(
      {String videoID, String category}) async {
    ResponsModel response = await repPost(
      'register_video',
      body: {
        'video': videoID,
        'category': category,
      },
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> setUnRegisterVideo(
      {String videoID, String category}) async {
    ResponsModel response = await repPost(
      'unregister_video',
      body: {
        'video': videoID,
        'category': category,
      },
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> getSubCategories({@required sub_categories}) async {
    ResponsModel response = await repGet(
      'sub_categories/${sub_categories}',
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> getViewVideosList() async {
    ResponsModel response = await repPost(
      'videos_list',
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> setViewVideosBalance({String ViewVideoId}) async {
    ResponsModel response = await repPost(
      'view_video/${ViewVideoId}',
      showLoading: true,
    );
    return response;
  }
}
