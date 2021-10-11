import 'dart:async';

import 'package:flutter/material.dart';

import 'package:grow/app/data/app_constand.dart';
import 'package:get/get.dart';
import 'package:grow/app/modules/youtubeview/controllers/youtubeview_controller.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class VedioViewx extends StatefulWidget {
  int duration;
  String Veidoid;

  VedioViewx(this.duration, this.Veidoid);

  @override
  _VedioViewState createState() => _VedioViewState();
}

class _VedioViewState extends State<VedioViewx> {
  var time = '0'.obs;
  var flg = true.obs;
  Timer _timer;
  YoutubeviewController controller = Get.put(YoutubeviewController());

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (time.value == '0') {
          timer.cancel();
          controller
              .setViewVideosBalance(ViewVideoId: widget.Veidoid)
              .then((value) => time.value = value);
        } else {
          time.value = (int.parse(time.value) - 1).toString();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    time.value = widget.duration.toString();
    startTimer();
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      print(orientation.toString());

      return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(
            children: [





              Container(child: Text('ffff'),),



              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    
                    orientation == Orientation.landscape
                        ? SizedBox.shrink()
                        : SizedBox(
                            height: 60,
                            child: Row(
                              children: [
                                Container(
                                  child: IconButton(
                                      icon: Icon(Icons.arrow_back),
                                      onPressed: () {
                                        Get.back();
                                      }),
                                ),
                                Obx(
                                  () {
                                    return Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              time.value.toString(),
                                              style: TextStyle(
                                                  color: KprimaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),




/*
WebviewScaffold(
                url: 'https://www.youtube.com/watch?v=clhjsVgHq-w'),*/

                    SizedBox(
                      height: (Get.height) - (statusBarHeight + 60),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Center(
                            child: Container(
                              width: Get.width,
                              child: WebView(
                                initialUrl:
                                    "https://www.youtube.com/watch?v=${widget.Veidoid}",
                                initialMediaPlaybackPolicy:
                                    AutoMediaPlaybackPolicy.always_allow,
                                allowsInlineMediaPlayback: true,
                                debuggingEnabled: true,
                                javascriptMode: JavascriptMode.unrestricted,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: (Get.height) - (statusBarHeight + 160),
                              color: Colors.white.withOpacity(0),
                            ),
                          )
                        ],
                      ),
                    ),














                    
                  ],
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}

