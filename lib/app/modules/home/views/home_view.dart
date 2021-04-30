import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/package/views/package_view.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List<String> ServicesBaner = [
    'images/youtube_baner.png',
    'images/instagram_banner.png',
    'images/facebook_baner.png',
  ];

    List<String> ServicesLogo = [
    'images/yt.png',
    'images/inst.png',
    'images/fb.png',
  ];

  List<String> youtube = [
    'Buy YouTube Subscribers',
    'Buy YouTube Views',
    'Buy YouTube Likes',
    'Buy YouTube Dislikes',
    'Buy YouTube Comments',
    'Buy YouTube Shares',
    'Buy YouTube Watch Hours',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('G R O W'),
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
            SizedBox(
              width: Get.width,
              child: Text(
                'Social Media Services',
                textAlign: TextAlign.left,
                style: styleTextTitle.copyWith(fontSize: 16),
              ),
            ),
            SocialServices(
              context,
              ServicesBaner[0],
              youtube,
              ServicesLogo[0]
            ),
            SizedBox(
              height: 10,
            ),
            SocialServices(
              context,
              ServicesBaner[1],
              instagram,       ServicesLogo[1]
            ),
            SizedBox(
              height: 10,
            ),
            SocialServices(
              context,
              ServicesBaner[2],
              facebook,       ServicesLogo[2]
            ),
            Features(),
          ],
        ),
      ),
    );
  }

  Container SocialServices(
    BuildContext context,
    String SocialServicesBaner,
    List<String> ServicesList,String SocialServicesLogo,
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
                children: List.generate(ServicesList.length, (index) {
              return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new PackageView(),
                      ),
                    );
                  },
                  title: Text(ServicesList.elementAt(index).toString()),
                  leading: Image.asset(SocialServicesLogo));
            }).toList()),
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
            style: styleTextSubTitle,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: KprimaryColor.withOpacity(.6),
                      border: Border.all(color: KprimaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('images/followers.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Real Followers',
                    style: styleTextSubTitle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: KprimaryColor.withOpacity(.6),
                      border: Border.all(color: KprimaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('images/fast-delivery.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Real Followers',
                    style: styleTextSubTitle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: KprimaryColor.withOpacity(.6),
                      border: Border.all(color: KprimaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('images/dollar.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Best prices',
                    style: styleTextSubTitle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
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
