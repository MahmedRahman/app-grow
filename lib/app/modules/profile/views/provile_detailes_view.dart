import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:grow/app/modules/profile/controllers/profile_controller.dart';

class ProfileDetailesView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Detailes'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
