import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/app/api/api_manger.dart';
import 'package:grow/app/api/response_model.dart';

class WebServices extends APIManger {
  Future<ResponsModel> getChannelsList() async {
    ResponsModel response = await repPost('channels_list');
    return response;
  }

  Future<ResponsModel> getChannelsVideoList() async {
    ResponsModel response = await repPost('channel_info');
    return response;
  }

  Future<ResponsModel> setChannelSubscribe(String channelID) async {
    ResponsModel response = await repPost(
      'channel_subscribe/$channelID',
      showLoading: true
    );
    return response;
  }
}
