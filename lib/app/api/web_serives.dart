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
    ResponsModel response =
        await repPost('channel_subscribe/$channelID', showLoading: true);
    return response;
  }

  Future<ResponsModel> getShowPakcages() async {
    ResponsModel response = await repPost('packages');
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
}
