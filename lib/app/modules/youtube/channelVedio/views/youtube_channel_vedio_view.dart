import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/component/CustomImageCached.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/channel_info.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/viideos_list.dart';

import '../controllers/youtube_channel_vedio_controller.dart';

class YoutubeChannelVedioView extends GetView<YoutubeChannelVedioController> {
  @override
  Widget build(BuildContext context) {
    controller.getChannelViedoList(Get.arguments[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('YoutubeChannelVedioView'),
        centerTitle: true,
      ),
      body: GetX<YoutubeChannelVedioController>(
      
        builder: (builder) {
          return FutureBuilder(
              future: controller.ChannelViedoList.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  VideosList videosList =snapshot.data;
                 // String PlayList = channelInfo.items.first.contentDetails.relatedPlaylists.uploads;
                 
                  return ListView(
                    children: List.generate(videosList.videos.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Card(
                          child: Column(
                            children: [
                              CustomImageCached(imageUrl: videosList.videos.elementAt(index).video.thumbnails.standard.url),
                              ListTile(
                                title: Text(videosList.videos.elementAt(index).video.title),
                                subtitle: Text(videosList.videos.elementAt(index).video.channelTitle),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList()
                  );
                }
                return CircularProgressIndicator();
              });
        }
      ),
    );
  }
}
