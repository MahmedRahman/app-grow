import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/component/CustomImageCached.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/viideos_list.dart';
import 'package:grow/app/modules/youtube/channels/model/youtube_channels_model.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/youtube_my_channels_controller.dart';

class YoutubeMyChannelsView extends GetView<YoutubeMyChannelsController> {
  @override
  Widget build(BuildContext context) {
    YoutubeMyChannelsController controller =
        Get.put(YoutubeMyChannelsController());
    controller.getMyChannels();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Channels',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GetX<YoutubeMyChannelsController>(builder: (_) {
        return FutureBuilder(
            future: controller.youtubeChannelsList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Datum> ChannelsList = snapshot.data;

                return ListView(
                  children: List.generate(
                    ChannelsList.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.YOUTUBE_CHANNEL_VEDIO,
                                  arguments: [
                                    ChannelsList.elementAt(index).channelId
                                  ],
                                );
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      ClipOval(
                                        child: CustomImageCached(
                                          imageUrl:
                                              ChannelsList.elementAt(index)
                                                  .logo,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      Text(ChannelsList
                                                              .elementAt(index)
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
                                                      Text(ChannelsList
                                                              .elementAt(index)
                                                          .subscriberCount),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                ChannelsList.elementAt(index).registered
                                    ? Expanded(
                                        child: MaterialButton(
                                          color: KprimaryColor,
                                          onPressed: () {
                                            controller.setUnRegisterChannel(
                                              channelID:
                                                  ChannelsList.elementAt(
                                                          index)
                                                      .channelId
                                                      .toString(),
                                            );
                                          },
                                          child: Text(
                                            'Un-Register Channel',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: MaterialButton(
                                          color: KprimaryColor,
                                          onPressed: () {
                                            controller.setRegisterChannel(
                                              channelID:
                                                  ChannelsList.elementAt(
                                                          index)
                                                      .channelId
                                                      .toString(),
                                            );
                                          },
                                          child: Text(
                                            'Register Channel',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            )
                          ],
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
            });
      }),
    );
  }
}
