import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:grow/app/component/CustomImageCached.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtube/channels/model/Chanel_list.dart';
import 'package:grow/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/youtube_channels_controller.dart';

class YoutubeChannelsView extends GetView<YoutubeChannelsController> {
  @override
  Widget build(BuildContext context) {
    YoutubeChannelsController controller = Get.put(YoutubeChannelsController());
    controller.getYoutubeChannelList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscribe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return FutureBuilder(
          future: controller.youtubeChannelsList.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> ChannelsList = snapshot.data;

              return ListView(
                children: List.generate(
                  ChannelsList.length,
                  (index) {
                    return InkWell(
                      onTap: () {
/*
                          Get.toNamed(
                            Routes.YOUTUBE_CHANNEL_VEDIO,
                            arguments: [ChannelsList.elementAt(index).channelId],
                          );
                          */
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Row(
                            children: [
                              ClipOval(
                                child: CustomImageCached(
                                  imageUrl: ChannelsList.elementAt(index).logo,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      '${ChannelsList.elementAt(index).title}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: KprimaryColor,
                                          fontSize: 14),
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Subscribers'),
                                          Row(
                                            children: [
                                              Icon(Icons.video_call),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(ChannelsList.elementAt(index)
                                                  .videos),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Videos'),
                                          Row(
                                            children: [
                                              Icon(Icons.play_arrow),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(ChannelsList.elementAt(index)
                                                  .subscriberCount),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: ChannelsList.elementAt(index)
                                                .subscribtionStatus
                                            ? Colors.grey[200]
                                            : Colors.red),
                                    onPressed: () {
                                      ChannelsList.elementAt(index)
                                              .subscribtionStatus
                                          ? null
                                          : controller.setChannelSubscribe(
                                              ChannelsList.elementAt(index)
                                                  .channelId);
                                      ;
                                    },
                                    child: Text('subscriptions'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: KprimaryColor,
              ),
            );
          },
        );
      }),
    );
  }
}
