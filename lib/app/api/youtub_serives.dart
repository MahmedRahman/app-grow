import 'dart:io';

//import 'package:flutter_demos/models/channel_info.dart';
//import 'package:flutter_demos/models/viideos_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/channel_info.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//import 'constants.dart';

class YoutubServices {
  //
  //static const CHANNEL_ID = 'UC5lbdURzjB0irr-FTbjWN1A';
  static const _baseUrl = 'www.googleapis.com';

  getChannelInfo({
    @required String channelID,
  }) async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': channelID,
      'key': 'AIzaSyBGj_Duj__ivCxJ2ya3ilkVfEzX1ZSRlpE',
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);

   return response.body;
  
  }

  getVideosList({String playListId, String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '8',
      'pageToken': pageToken,
      'key': 'AIzaSyBGj_Duj__ivCxJ2ya3ilkVfEzX1ZSRlpE',
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);

    return response.body;
    // print(response.body);
    //VideosList videosList = videosListFromJson(response.body);
    //return videosList;
  }
}
