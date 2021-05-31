import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:grow/app/api/response_model.dart';

String baes_url = 'https://dev.matrixclouds.com/growapp/public/api/';
String api_key = 'growapp_api_key';
String Language = 'ar';
const Kyoutube_token =
    "ya29.a0AfH6SMBc9YZhde2ZRX0-rRihte2v7YJWJfk4nLxu_EDgadripJHCHzA12iJF0DWAfM228uGjBoebguFUovGpp2DxXTenM0ICLubXQj4PoZ933DZzuGEpKRo6nKXIrhB1S2rXhyZl8ZfMlBU8NCVNSsswgbBh";

class APIManger extends GetConnect {
  
  final header = {
    'x-api-key': api_key,
    'Authorization': 'Bearer ',
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  void login() {
    String tokan =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzNiYTYwMGU4NTE4YzdjZGZjYmFkZWYwZmM2MTlmZmZjNDEzOWRkYTA4MTJiZDRmNDY3NDQ4M2Y5YzIxODY4Y2FkZmJiYzczNjU2Yzg3MjciLCJpYXQiOjE2MjAzMDg5MjMuMTY2MzYzOTU0NTQ0MDY3MzgyODEyNSwibmJmIjoxNjIwMzA4OTIzLjE2NjM2NzA1Mzk4NTU5NTcwMzEyNSwiZXhwIjoxNjUxODQ0OTIzLjE2MTc2Nzk1OTU5NDcyNjU2MjUsInN1YiI6IjUiLCJzY29wZXMiOltdfQ.VvjQ0WN_rpnG2F9kRFNKytZTXpH1LEf68c_SP7vdod5-IQG6UdvZXiSN3FZqn4pPp5-guXZ-4H_XGxsAxqt8TmNAecQxsdRa_sqj7ulgo2EzBa1IIwfAnDHsHOqb2eVal1ePso4EcbfdRNCoe56Etd3mQstsxuWGBnBCVl_Hs3NTIlHneqACumebcT7LffvfM-XB11Wc16ZO00eUOI6yI0w7ijAdG2gY1f_jUH0WPq5oaXy1NtPhBJ-WnRt2ifvqFdk-Z-BCnNKMTlA1bbvNtGGLZzZPpfzyrPBp_6YmXguSm5x3ySN36GbPmyhBlY6bRnYw8ZMiG0VuoUNgIt4WpYQNwrujPp4bJnf0cn3D5TKa1gPbSYpI7c9Lr9c5TgqRmldI6mGz1hmTusuQu8Pd9YPUXBVX4WeWnztRlc9mHr4BsGcStoID4WAq6hAnmXLbiWxBbPPeDJAJfHd9qtJnYEfaFOFStp1uPJa0OOHpBqxO8LGoabHqTfjMwsr9bdLL2NP_awCOYEYAD5SKXfpilQgj0RLxNsOxmCl7ns2elegyJJOfSh3-4ibHGG8NJH3Y27fH8QpaX_oAEa18XV0rDwEhDoCbfbV_y9-ZWkvhiMpxQJFxl7rLK8vWBLLAjogPZxHtpNG9-d_Ce7cotUE0ulCiT3O_h2pwJKCH7PKP-Gc';

    if (tokan != null) {
      header.update(
        'Authorization',
        (value) {
          return 'Bearer ' + tokan;
        },
      );
    }
  }

  Future<ResponsModel> repPost(url, {body, bool showLoading = false}) async {
    if (showLoading) {
      EasyLoading.show(status: 'Loading ...');
    }

    login();

    Response response = await post(baes_url + url, body, headers: header);

    print("Api Request $baes_url$url ${response.statusCode} ");

    try {
      switch (response.statusCode) {
        case 200:
          if (showLoading) {
            EasyLoading.dismiss();
          }

          return ResponsModel(
            code: response.statusCode,
            success: true,
            data: response,
          );
          break;

        default:
          if (showLoading) {
            EasyLoading.showError('Error');
          }

          Get.to(ErrorView(
            api_url: url.toString(),
            api_body: body.toString(),
            api_header: header.toString(),
            api_status_code: response.statusCode.toString(),
          ));
          return ResponsModel(
            code: response.statusCode,
            success: false,
          );
      }
    } catch (e) {
      if (showLoading) {
        EasyLoading.showError('Error');
      }

      Get.to(ErrorView(
        api_url: response.headers.toString(),
        api_body: e.toString(),
        api_header: '',
        api_status_code: e.hashCode.toString(),
      ));
      return ResponsModel(
        code: e.hashCode,
        success: false,
      );
    }
  }

  Future<ResponsModel> repGet(url, {bool showLoading = false}) async {
    if (showLoading) {
      EasyLoading.show(status: 'Loading ...');
    }

    print("Api Request " + baes_url + url);
    login();
    Response response;
    if (GetUtils.isURL(url)) {
      response = await get(url, headers: header);
    } else {
      response = await get(baes_url + url, headers: header);
    }

    print("Api Request " +
        baes_url +
        url +
        " Api Request:: " +
        response.statusCode.toString());

    try {
      switch (response.statusCode) {
        case 200:
          if (showLoading) {
            EasyLoading.dismiss();
          }
          return ResponsModel(
            code: response.statusCode,
            success: true,
            data: response,
          );
          break;

        default:
          if (showLoading) {
            EasyLoading.showError('Erro');
          }
          Get.to(
            ErrorView(
              api_url: url.toString(),
              api_body: '',
              api_header: header.toString(),
              api_status_code: response.statusCode.toString(),
            ),
          );
          return ResponsModel(
            code: response.statusCode,
            success: false,
          );
      }
    } catch (e) {
      if (showLoading) {
        EasyLoading.showError('Erro');
      }
      Get.to(ErrorView(
        api_url: response.headers.toString(),
        api_body: e.toString(),
        api_header: '',
        api_status_code: e.hashCode.toString(),
      ));
      return ResponsModel(
        code: e.hashCode,
        success: false,
      );
    }
  }
}

class ErrorView extends GetView {
  ErrorView({
    this.api_url,
    this.api_header,
    this.api_body,
    this.api_status_code,
  });

  final String api_url;
  final String api_header;
  final String api_body;
  final String api_status_code;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            //Lottie.asset('assets/error_api.json'),
            ListTile(
              title: Text('API Url'),
              subtitle: Text(api_url),
            ),
            ListTile(
              title: Text('API Header'),
              subtitle: Text(api_header.toString()),
            ),
            ListTile(
              title: Text('API Body'),
              subtitle: Text(api_body.toString()),
            ),
            ListTile(
              title: Text('API Status Code'),
              subtitle: Text(api_status_code),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'أعادة المحاولة',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
