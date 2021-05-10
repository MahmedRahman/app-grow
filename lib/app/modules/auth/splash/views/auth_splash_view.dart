import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/routes/app_pages.dart';
import 'package:grow/app/api/youtub_serives.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controllers/auth_splash_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthSplashView extends GetView<AuthSplashController> {
  final googleSignIn = GoogleSignIn();
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
              Image.asset('images/logo2.png'),
             
              SizedBox(
                height: Get.height * .1,
              ),
              SizedBox(
                width: Get.width,
                height: 50,
                child: ElevatedButton(
                  
                  onPressed: () {
                    Get.toNamed(Routes.AUTH_SIGNUP);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: KprimaryColor,
                  ),
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      color: KaccentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: Get.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.AUTH_LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: KprimaryColor,
                  ),
                  child: Text(
                    'login',
                    style: TextStyle(
                      color: KaccentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .2,
              ),
              SizedBox(
                height: 10,
              ),
             /* SizedBox(
                width: Get.width,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    /*
                    googleSignIn.requestScopes(
                      [
                        'https://www.googleapis.com/auth/youtubepartner',
                        'https://www.googleapis.com/auth/youtube',
                        'https://www.googleapis.com/auth/youtube.force-ssl'
                      ],
                    );

                    final user = await googleSignIn.signIn();

                    if (user == null) {
                      // isSigningIn = false;
                      print('Wrong');
                      return;
                    } else {
                      final googleAuth = await user.authentication;
                      final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth.accessToken,
                        idToken: googleAuth.idToken,
                      );
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);

                      print('accessToken ${googleAuth.accessToken}');
                      print('serverAuthCode ${googleAuth.serverAuthCode}');
                      print('scopes ${googleSignIn.scopes}');
                      print('idToken :${googleAuth.idToken}');

                      print('email :${user.email}');
                      print('email :${user.displayName}');
                      print('email :${user.photoUrl}');

                      print('Done');
                    }
                    */
                  },
                  icon: Image.asset('images/gmail_icon.png'),
                  label: Text(
                    'Login with Gmail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await googleSignIn.disconnect();
                  FirebaseAuth.instance.signOut();
                },
                child: Text('signOut'),
              )
           */
           
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
