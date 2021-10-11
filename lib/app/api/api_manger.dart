import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/data/app_constand.dart';

String baesUrl = 'https://grow-app.net/api/';
String apiKey = 'growapp_api_key';
String language = 'ar';

var apiBody = '';

final header = {
  'x-api-key': apiKey,
  'Content-Language': language,
  'Authorization': 'Bearer ',
};

class APIManger extends GetConnect {
  authorization() {
    String tokan = KuserYoutubeTokan;

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
    url = baesUrl + url;
    apiBody = body.toString();
    authorization();

    showLoading
        ? EasyLoading.show(status: 'جارى التحميل ...')
        : SizedBox.shrink();

    print("Api Request Post $url ");

    Response response = await post(
      url,
      body,
      headers: header,
    );

    print(
        "Api Request ${response.request.method} ${response.request.url.toString()} ${response.statusCode.toString()}");

    showLoading ? EasyLoading.dismiss() : SizedBox.shrink();

    return responseAnalyzes(response: response);
  }

  Future<ResponsModel> repGet(url, {bool showLoading = false}) async {
    url = baesUrl + url;
    apiBody = '';
    authorization();

    showLoading ? EasyLoading.show(status: 'جارى التحميل') : SizedBox.shrink();

    print("Api Request Get " + url);

    Response response = await get(
      url,
      headers: header,
    );

    print(
        "Api Request ${response.request.method} ${response.request.url.toString()} ${response.statusCode.toString()}");

    showLoading ? EasyLoading.dismiss() : SizedBox.shrink();

    return responseAnalyzes(response: response);
  }

  ResponsModel responseAnalyzes({Response response}) {
    switch (response.statusCode) {
      case 200:
        return ResponsModel(
          code: response.statusCode,
          success: true,
          data: response,
        );
        break;
      case 401:
        //Get.toNamed(Routes.SIGNIN);
        return ResponsModel(
          code: 401,
          success: false,
        );
        break;
      default:
        Get.to(ErrorView(response: response));
        return ResponsModel(
          code: response.statusCode,
          success: false,
        );
    }
  }
}

class ErrorView extends GetView {
  ErrorView({
    this.response,
  });

  final Response response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                title: Text('API Method Type'),
                subtitle: Text(response.request.method),
              ),
              ListTile(
                title: Text('API Url'),
                subtitle: Text('${response.request.url.toString()}'),
                trailing: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(
                          text: response.request.url.toString()));
                    }),
              ),
              ListTile(
                title: Text('API Body'),
                subtitle: Text('Body'),
                trailing: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(
                        text: apiBody.toString(),
                      ));
                    }),
              ),
              ListTile(
                title: Text('Response'),
                subtitle: Text('Response'),
                trailing: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(
                        text: response.bodyString,
                      ));
                    }),
              ),
              ListTile(
                title: Text('Tokan'),
                subtitle: Text('Tokan'),
                trailing: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(
                        text: KuserYoutubeTokan.toString(),
                      ));
                    }),
              ),
              ListTile(
                title: Text('API Status Code'),
                subtitle: Text(response.statusCode.toString()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () async {
                      final Email email = Email(
                        subject: '${AppName} Status Code ${response.statusCode.toString()} ',
                        body : '<html> API Method Type <br> ${response.request.method} <br>	 API Url <br> ${response.request.url.toString()} <br>	  API Body <br> ${apiBody.toString()} <br> Tokan ${KuserYoutubeTokan.toString()} </html>',
                        recipients: ['atpfreelancer@gmail.com'],
                        isHTML: true,
                      );

                      await FlutterEmailSender.send(email);
                    },
                    child: Text(
                      'Send Email',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Try Again',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
