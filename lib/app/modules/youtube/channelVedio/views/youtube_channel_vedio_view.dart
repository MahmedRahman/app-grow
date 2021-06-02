import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/component/CustomImageCached.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtube/channelVedio/model/my_vedio.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/channel_info.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/viideos_list.dart';

import '../controllers/youtube_channel_vedio_controller.dart';

class YoutubeChannelVedioView extends GetView<YoutubeChannelVedioController> {




  @override
  Widget build(BuildContext context) {
    controller.getChannelViedoList(Get.arguments[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Vedio'),
        centerTitle: true,
      ),
      body: GetX<YoutubeChannelVedioController>(builder: (builder) {
        return FutureBuilder(
            future: controller.myVideo.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                MyVideoModel videosList = snapshot.data;
                // String PlayList = channelInfo.items.first.contentDetails.relatedPlaylists.uploads;

                return ListView(
                    children: List.generate(videosList.data.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Card(
                      child: Column(
                        children: [
                          CustomImageCached(
                              imageUrl:
                                  videosList.data.elementAt(index).thumbnails),
                          ListTile(
                            title: Text(videosList.data.elementAt(index).title),
                            subtitle: Text(videosList.data
                                .elementAt(index)
                                .publishedAt
                                .toString()),
                          ),
                          videosList.data.elementAt(index).registered
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: MaterialButton(
                                      height: 50,
                                      color: KprimaryColor,
                                      onPressed: () {
                                        controller.setUnRegistered(
                                            videoID: videosList.data
                                                .elementAt(index)
                                                .id);
                                      },
                                      child: Text(
                                        'Un Registered',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: MaterialButton(
                                      height: 50,
                                      color: KprimaryColor,
                                      onPressed: () {
                                        controller.setRegistered(
                                            videoID: videosList.data
                                                .elementAt(index)
                                                .id);
                                      },
                                      child: Text(
                                        'Registered',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                }).toList());
              }
              return CircularProgressIndicator();
            });
      }),
    );
  }
}
