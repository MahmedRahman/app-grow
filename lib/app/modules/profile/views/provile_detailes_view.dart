import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/profile/controllers/profile_controller.dart';
import 'package:grow/app/modules/profile/model/model_profile.dart';

class ProfileDetailesView extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    controller.getProfile();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return FutureBuilder(
            future: controller.PresonalInfoList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Info presonalInfo;
                presonalInfo = snapshot.data;

                return SizedBox(
                  width: Get.width,
                  child: ListView(
                  
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: KprimaryColor,
                        backgroundImage: NetworkImage(presonalInfo.avatar),
                        
                        child: Text(
                          'G',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        radius: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${presonalInfo.name}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${presonalInfo.email}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                   
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Channels Count',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${presonalInfo.channelsCount}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Videos Count',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${presonalInfo.videosCount}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                  
                  
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'subscribers',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${presonalInfo.subscribers}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'subscribtions',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${presonalInfo.subscribtions}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'viewers',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${presonalInfo.viewers}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'views',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${presonalInfo.views}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

              
                   
                      Row(
                        children: [
                   
                      
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'balance',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${presonalInfo.balance}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                  
                 
                    ],
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: KprimaryColor,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
