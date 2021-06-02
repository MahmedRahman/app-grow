import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/package/views/package_view.dart';
import 'package:grow/app/modules/youtube/channels/views/youtube_channels_view.dart';
import 'package:grow/app/modules/youtubeview/views/youtubeview_view.dart';
import 'package:grow/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List<String> ServicesBaner = [
    'images/youtube_baner.png',
  ];

  List<String> ServicesLogo = [
    'images/yt.png',
  ];

  List<String> youtube = [
    'Buy YouTube Subscribers',
    'Buy YouTube views',
  ];

  List<String> youtube_earn = [
    'Subscribe',
    'views',
  ];

  List<String> instagram = [
    'Buy Followers On Instagram',
    'Buy Instagram Views',
    'Buy Instagram Comments',
  ];

  List<String> facebook = [
    'Buy Facebook Likes',
    'Buy Facebook Page Likes',
    'Buy Facebook Views',
    'Buy Facebook 5 Star Ratings',
  ];

  static var selectIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'G R O W',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              width: Get.width,
              child: Image.asset('images/baner.png'),
            ),
            Text(
              'What do you need most ?',
              textAlign: TextAlign.left,
              style: styleTextTitle.copyWith(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NeedBnt('images/trend.svg', 'Account Grow', 0),
                  NeedBnt('images/money.svg', 'Earn Money', 1),
                ],
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Text(
                'Social Media Services',
                textAlign: TextAlign.left,
                style: styleTextTitle.copyWith(fontSize: 16),
              ),
            ),
            Container(
              color: KprimaryColor.withOpacity(.6),
              child: ExpansionTile(
                backgroundColor: KaccentColor,
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 32,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    height: 40,
                    child: Image.asset('images/youtube_baner.png'),
                  ),
                ),
                children: [
                  Container(
                    color: Colors.white,
                    child: Obx(
                      () {
                        return selectIndex.value == 0
                            ? Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      KtypePakcages = "subscribers";
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new PackageView(),
                                        ),
                                      );
                                    },
                                    title: Text('Buy YouTube Subscribers'),
                                    leading: Icon(Icons.youtube_searched_for),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      KtypePakcages = "views";
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new PackageView(),
                                        ),
                                      );
                                    },
                                    title: Text('Buy YouTube views'),
                                    leading: Icon(Icons.youtube_searched_for),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new YoutubeChannelsView(),
                                        ),
                                      );
                                    },
                                    title: Text('Subscribe'),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new YoutubeviewView(),
                                        ),
                                      );
                                    },
                                    title: Text('views'),
                                  )
                                ],
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Features(),
          ],
        ),
      ),
    );
  }

  Widget NeedBnt(String bntImage, String bntLabel, int index) {
    return Obx(
      () {
        return InkWell(
          onTap: () {
            selectIndex.value = index;
          },
          child: Container(
            decoration: selectIndex.value == index
                ? BoxDecoration(
                    color: KprimaryColor,
                    borderRadius: BorderRadius.circular(15),
                  )
                : BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    bntImage,
                    color: selectIndex.value == index
                        ? Colors.white
                        : KprimaryColor,
                  ),
                  Text(
                    bntLabel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectIndex.value == index
                          ? Colors.white
                          : KprimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container SocialServices(
    BuildContext context,
    String SocialServicesBaner,
    List<String> ServicesList,
    String SocialServicesLogo,
  ) {
    return Container(
      color: KprimaryColor.withOpacity(.6),
      child: ExpansionTile(
        backgroundColor: KaccentColor,
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 32,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SizedBox(
            height: 40,
            child: Image.asset(SocialServicesBaner),
          ),
        ),
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: List.generate(
                ServicesList.length,
                (index) {
                  return ListTile(
                    onTap: () {
                      if (ServicesList.elementAt(index) ==
                          "Buy YouTube Subscribers") {
                        KtypePakcages = "subscribers";
                      }

                      if (ServicesList.elementAt(index) ==
                          "Buy YouTube views") {
                        KtypePakcages = "views";
                      }

                      HomeView.selectIndex.value == 1
                          ? Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new YoutubeChannelsView(),
                              ),
                            )
                          : Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new PackageView(),
                              ),
                            );
                    },
                    title: Text(ServicesList.elementAt(index).toString()),
                    leading: Image.asset(SocialServicesLogo),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Column Features() {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: Text(
            'Unique Features',
            textAlign: TextAlign.left,
            style: styleTextTitle.copyWith(
              fontSize: 16,
              color: KScandtColor,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF8DE),
                      border: Border.all(color: KprimaryColor),
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 100,
                      child: Image.asset('images/followers.png'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Fast time',
                    style: styleTextSubTitle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: KScandtColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF8DE),
                      border: Border.all(color: KprimaryColor),
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 100,
                      child: Image.asset('images/fast-delivery.png'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Fast time',
                    style: styleTextSubTitle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: KScandtColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF8DE),
                      border: Border.all(color: KprimaryColor),
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 100,
                      child: Image.asset('images/dollar.png'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Fast time',
                    style: styleTextSubTitle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: KScandtColor),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
