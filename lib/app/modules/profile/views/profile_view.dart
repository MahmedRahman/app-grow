import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/profile/views/provile_detailes_view.dart';
import 'package:grow/app/modules/youtube/my_channels/views/youtube_my_channels_view.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {

  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new ProfileDetailesView(),
                            ),
                          );
              
            },
            title: Text('Welcome'),
            subtitle: Text('growapp21@gmail.com'),
            leading: CircleAvatar(
              backgroundColor: KprimaryColor,
              child: Text(
                'G',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: KprimaryColor,
                ),
                onPressed: () {
                  Get.toNamed(Routes.AUTH_SPLASH);
                }),
          ),
          Divider(),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext Context) =>
                        new YoutubeMyChannelsView(),
                  ),
                );
              },
              title: Text('My Youtube Channel'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: KprimaryColor,
              ),
              leading: Image.asset('images/yt.png'),
            ),
          ),
          /* 
          Card(
            child: ListTile(
              title: Text('Facebook'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: KprimaryColor,
              ),
              leading: Image.asset('images/fb.png'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Instagram'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: KprimaryColor,
              ),
              leading: Image.asset('images/inst.png'),
            ),
          ),
       
          Card(
            child: ListTile(
              title: Text('My payments'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: KprimaryColor,
              ),
              leading: Image.asset('images/payment.png'),
            ),
          ),
*/

          Card(
            child: ListTile(
              title: Text('Settings'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: KprimaryColor,
              ),
              leading: Image.asset('images/settings.png'),
            ),
          )
        ],
      ),
    );
  }
}
