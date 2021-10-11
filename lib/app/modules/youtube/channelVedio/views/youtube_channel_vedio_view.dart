import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/component/CustomImageCached.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/data/componate.dart';
import 'package:grow/app/modules/youtube/channelVedio/model/my_vedio.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/channel_info.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/viideos_list.dart';

import '../controllers/youtube_channel_vedio_controller.dart';

class YoutubeChannelVedioView extends GetView<YoutubeChannelVedioController> {
  @override
  Widget build(BuildContext context) {
    controller.getCategory();
    controller.getChannelViedoList(Get.arguments[0]);
    return Scaffold(
      appBar: defualtappBar(title: 'My Vedio'.tr),
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
                          ),
                          SizedBox(
                            height: 10,
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
                                        'Un Registered'.tr,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButtonFormField(
                                        decoration: new InputDecoration(
                                          filled: true,
                                          fillColor:
                                              KprimaryColor.withOpacity(.1),
                                          labelText: 'قسم رائسى',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (v) => v.isNotEmpty
                                            ? null
                                            : 'مينفعش تسيب هنا فاضى',
                                        isExpanded: true,
                                        value: null,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        items: categoriesItems.map((items) {
                                          return DropdownMenuItem(
                                            value: items['id'],
                                            child: Text(
                                              items['title'],
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                            controller.category =
                                                val.toString();

                                          /*controller
                                              .getsubCategory(
                                                  subCategories: val.toString())
                                              .then((value) {
                                            subcategoriesItems.value = value;
                                          });*/
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    /*
                                    Obx(() {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonFormField(
                                          decoration: new InputDecoration(
                                            filled: true,
                                            fillColor:
                                                KprimaryColor.withOpacity(.1),
                                            labelText: 'قسم رائسى',
                                            border: OutlineInputBorder(),
                                          ),
                                          validator: (v) => v.isNotEmpty
                                              ? null
                                              : 'مينفعش تسيب هنا فاضى',
                                          isExpanded: true,
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          items: List.generate(
                                              subcategoriesItems.length,
                                              (index) => DropdownMenuItem(
                                                    value: subcategoriesItems
                                                        .elementAt(index)['id'],
                                                    child: Text(
                                                      subcategoriesItems
                                                          .elementAt(
                                                              index)['title']
                                                          .toString(),
                                                    ),
                                                  )),
                                          onChanged: (val) {
                                            controller.category =
                                                val.toString();
                                          },
                                        ),
                                      );
                                    }),
                                   
                                    Obx(
                                       () {
                                        return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DropdownButtonFormField(
                                              decoration: new InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    KprimaryColor.withOpacity(.1),
                                                labelText: 'قسم فرعى',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (v) => v.isNotEmpty
                                                  ? null
                                                  : 'مينفعش تسيب هنا فاضى',
                                              isExpanded: true,
                                              value: 1,
                                              icon: Icon(Icons.keyboard_arrow_down),
                                              items:
                                                  subcategoriesItems.map((items) {
                                                print(items);
                                                print('-------------------');
                                                return DropdownMenuItem(
                                                  value: items['id'],
                                                  child: Text(
                                                    items['title'],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (val) {
                                                print(val);
                                                //controller.categoryId.text = val.toString();
                                              },
                                            ));
                                      }
                                    ),
                                  
                                  */
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: MaterialButton(
                                          height: 50,
                                          color: KprimaryColor,
                                          onPressed: () {
                                            if (GetUtils.isNullOrBlank(
                                                controller.category)) {
                                              Get.snackbar(
                                                  AppName, 'برجاء اختيار قسم');
                                            } else {
                                              controller.setRegistered(
                                                  videoID: videosList.data
                                                      .elementAt(index)
                                                      .id);
                                            }
                                          },
                                          child: Text(
                                            'Registered'.tr,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: 20,
                          ),
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
