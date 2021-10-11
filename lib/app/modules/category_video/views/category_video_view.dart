import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/componate.dart';
import 'package:grow/app/modules/youtube/channelVedio/model/my_vedio.dart';
import 'package:grow/app/modules/youtubeview/views/view_veido.dart';

import '../controllers/category_video_controller.dart';

class CategoryVideoView extends GetView<CategoryVideoController> {
  var vediolist;

  CategoryVideoView({this.vediolist});
  CategoryVideoController controller = Get.put(CategoryVideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defualtappBar(title: 'Category Video'),
      body: FutureBuilder(
          future: controller.getCategoryDetailes(vediolist),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: snapshot.data.length == 0
                    ? Container(
                        child: Text('no videos'.tr),
                      )
                    : Column(
                        children: List.generate(
                        snapshot.data.length,
                        (index) => InkWell(
                          onTap: () {
                                 Get.to(
                            VedioView(
                             snapshot.data[index]['duration'],
                             snapshot.data[index]['id'],
                            ),
                            fullscreenDialog: true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network(
                                    snapshot.data[index]['thumbnails'],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data[index]['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
