import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtubeview/controllers/youtubeview_controller.dart';
import 'package:pausable_timer/pausable_timer.dart';

//import 'package:webview_flutter/webview_flutter.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class VedioView extends StatefulWidget {
  int duration;
  String Veidoid;

  VedioView(this.duration, this.Veidoid);

  @override
  _VedioViewState createState() => _VedioViewState();
}

class _VedioViewState extends State<VedioView>
    implements YouTubePlayerListener {
  var time = '0'.obs;
  var flg = true.obs;

  bool isReady = false;

  YoutubeviewController controller = Get.put(YoutubeviewController());
  FlutterYoutubeViewController YoutubeViewController;
  YouTubePlayerListener listener;
  PausableTimer timer;

  void startTimer() {
    timer = PausableTimer(
      Duration(seconds: 1),
      () {
        time.value = (int.parse(time.value) - 1).toString();
        if (int.parse(time.value) > 0) {
          // we know the callback won't be called before the constructor ends, so
          // it is safe to use !
          timer
            ..reset()
            ..start();
        } else {
          controller.setViewVideosBalance(ViewVideoId: widget.Veidoid).then(
                (value) => time.value = value,
              );
          //print('viedio done');
        }
        // This is really what your callback do.
        print('\t$time.value');
      },
    )..start();

/*
Timer _timer;
    // YoutubeViewController.
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (time.value == '0') {
          timer.cancel();
        } else {
          time.value = (int.parse(time.value) - 1).toString();
        }
      },
    );*/
  }

  // @override
  // void initState() {
  //   super.initState();
  //   YoutubeViewController.handleEvent(call)
  // }

  @override
  Widget build(BuildContext context) {
    //startTimer();

    double statusBarHeight = MediaQuery.of(context).padding.top;

    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      //print(orientation.toString());

      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Obx(
              () {
                return Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Get.back();
                        }),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          child: Center(
                            child: Text(
                              time.value.toString(),
                              style: TextStyle(
                                color: KprimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: Container(
                child: FlutterYoutubeView(
                  onViewCreated: (flutterYoutubeViewController) {
                    time.value = widget.duration.toString();
                    YoutubeViewController = flutterYoutubeViewController;
                  },
                  scaleMode: YoutubeScaleMode.none,
                  params: YoutubeParam(
                    showFullScreen: false,
                    showYoutube: false,
                    videoId: widget.Veidoid,
                    showUI: false,
                    startSeconds: 0.0,
                    autoPlay: false,
                  ),
                  listener: this,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/bnt.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: () {
                        if (isReady) {
                          startTimer();
                          timer.start();
                          // _timer.reactive;

                          YoutubeViewController.play();
                        }
                      },
                      child: Text('Play'),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/bnt.jpg'),
                      fit: BoxFit.fill,
                    )),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: () {
                        //timer.r
                        timer.pause();
                        YoutubeViewController.pause();
                      },
                      child: Text('pause'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onCurrentSecond(double second) {
    // TODO: implement onCurrentSecond
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }

  @override
  void onReady() {
    print('onReady');
    // TODO: implement onReady
    setState(() {
      isReady = true;
    });
  }

  @override
  void onStateChange(String state) {
    // TODO: implement onStateChange
  }

  @override
  void onVideoDuration(double duration) {
    // TODO: implement onVideoDuration
  }
}
