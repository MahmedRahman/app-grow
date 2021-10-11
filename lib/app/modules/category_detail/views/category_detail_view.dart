import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/componate.dart';
import 'package:grow/app/modules/category_video/views/category_video_view.dart';
import 'package:grow/app/modules/youtube/channelVedio/views/youtube_channel_vedio_view.dart';

import '../controllers/category_detail_controller.dart';

class CategoryDetailView extends GetView<CategoryDetailController> {
  CategoryDetailController controller = Get.put(CategoryDetailController());

  var categoryId;

  CategoryDetailView({this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defualtappBar(
        title: 'Category',
      ),
      body: FutureBuilder(
          future: controller.getCategoryDetailes(categoryId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data.length,
                  (index) => InkWell(
                    onTap: () {
                      //print(snapshot.data[index]['id'].toString());

                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new CategoryVideoView(
                            vediolist: snapshot.data[index]['id'].toString(),
                          ),
                        ),
                      );

              
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('images/bg_title.png'),
                          fit: BoxFit.fill,
                        )),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                snapshot.data[index]['image'],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text(
                                  snapshot.data[index]['title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
