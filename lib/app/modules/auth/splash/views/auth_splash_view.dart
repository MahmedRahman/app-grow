import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/auth_splash_controller.dart';

class AuthSplashView extends GetView<AuthSplashController> {
  final googleSignIn =
      GoogleSignIn(scopes: ['https://www.googleapis.com/auth/youtube']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: KaccentColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Image.asset('images/logo2.png'),
              ),
              SizedBox(
                width: Get.width,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await GoogleSignIn().signOut().then((value) {
                      EasyLoading.show(status: 'Loading ...');

                      signInWithGoogle().then(
                        (googleuser) {
                          WebServices()
                              .getGoogleLogin(
                            name: googleuser.user.displayName,
                            email: googleuser.user.email,
                            avatar: googleuser.user.photoURL,
                          )
                              .then((value) {
                            Response response = value.data;
                            KuserTokan = response.body['data']['access_token'];

                            print('User Token: $KuserTokan');

                            EasyLoading.dismiss();
                            Get.offAllNamed(Routes.LAYOUT);
                          }).onError((error, stackTrace) {
                            EasyLoading.dismiss();
                          });
                        },
                        onError: (err) {
                          EasyLoading.dismiss();
                        },
                      );
                    });
                  },
                  icon: Image.asset('images/gmail_icon.png'),
                  label: Text(
                    'Login with Gmail'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // googleSignIn.requestScopes(
    //   [
    //     'https://www.googleapis.com/auth/youtube',
    //   ],
    // );

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    print('accessToken : ${googleAuth.accessToken}');
    print('idToken : ${googleAuth.idToken}');

    // KuserTokan = googleAuth.accessToken;
    KuserYoutubeTokan = googleAuth.accessToken;

    //print('Googel Tokan');
    //print(googleAuth.accessToken);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
