import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_forget_controller.dart';

class AuthForgetView extends GetView<AuthForgetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthForgetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AuthForgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
