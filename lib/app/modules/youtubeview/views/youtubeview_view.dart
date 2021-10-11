import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:grow/app/component/CustomImageCached.dart';
import 'package:grow/app/data/componate.dart';
import 'package:grow/app/modules/youtubeview/model/video_model.dart';
import 'package:grow/app/modules/youtubeview/views/view_veido.dart';

import '../controllers/youtubeview_controller.dart';

class YoutubeviewView extends GetView<YoutubeviewController> {
  YoutubeviewController controller = Get.put(YoutubeviewController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    controller.getViewVideosList();
    return Scaffold(
      appBar: defualtappBar(
        title: 'View Youtube Viedo',
      ),
      body: Obx(() {
        return FutureBuilder(
            future: controller.VideoList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Viedo viedo = snapshot.data;

                return ListView(
                  children: List.generate(
                    viedo.data.length,
                    (index) => InkWell(
                      onTap: () {
                        Get.to(
                            VedioView(
                              viedo.data.elementAt(index).duration,
                              viedo.data.elementAt(index).id,
                            ),
                            fullscreenDialog: true);
                      },
                      child: Card(
                        child: Column(
                          children: [
                            CustomImageCached(
                                imageUrl:
                                    viedo.data.elementAt(index).thumbnails),
                            ListTile(
                              title: Text(viedo.data.elementAt(index).title),
                              subtitle:
                                  Text(viedo.data.elementAt(index).description),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            });
      }),
    );
  }
}
