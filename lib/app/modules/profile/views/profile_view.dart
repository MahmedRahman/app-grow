import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
            title: Text('Welcome'),
            subtitle: Text('Mohamed Abd el Rahman'),
            leading: CircleAvatar(
              backgroundColor: KprimaryColor,
              child: Text(
                'M',
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
              title: Text('youtube'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: KprimaryColor,
              ),
              leading: Image.asset('images/yt.png'),
            ),
          ),
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
