import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/data/componate.dart';
import 'package:grow/app/modules/Privacy/views/privacy_view.dart';
import 'package:grow/app/modules/profile/views/provile_detailes_view.dart';
import 'package:grow/app/modules/youtube/my_channels/views/youtube_my_channels_view.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());
  User user = FirebaseAuth.instance.currentUser;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      // FirebaseFirestore.instance.clearPersistence();
      GoogleSignIn().signOut().then((value) => Get.toNamed(Routes.AUTH_SPLASH));

      // FirebaseAuth.instance.c
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defualtappBar(
        title: 'Setting'.tr,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {},
            title: Text('Welcome'.tr),
            subtitle: Text(user.displayName),
            leading: CircleAvatar(
              backgroundColor: KprimaryColor,
              child: Text(
                user.displayName.toString()[0].toUpperCase(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: KprimaryColor,
                ),
                onPressed: () {
                  _signOut();
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
              title: Text('My Youtube Channel'.tr),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: KprimaryColor,
              ),
              leading: Image.asset('images/yt.png'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                print(Get.locale.toLanguageTag());
                //var locale = Locale('ar');
                if (Get.locale.toLanguageTag() == 'ar') {
                  Get.updateLocale(Locale('en'));
                } else {
                  Get.updateLocale(Locale('ar'));
                }
              },
              title: Text('change language'.tr),
              leading: Icon(
                Icons.language,
                color: KprimaryColor,
              ),
            ),
          ),
      Card(
            child: ListTile(
              onTap: (){
                        Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext Context) =>
                        new PrivacyView(),
                  ),
                );
              },
              title: Text('Privacy'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: KprimaryColor,
              ),
              leading: Image.asset('images/settings.png'),
            ),
          )
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
*/
        ],
      ),
    );
  }
}
