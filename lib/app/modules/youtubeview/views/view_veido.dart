import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:get/get.dart';
import 'package:simple_timer/simple_timer.dart';

class VedioView extends StatefulWidget {
  int duration;
  String Veidoid;

  VedioView(this.duration, this.Veidoid);

  @override
  _VedioViewState createState() => _VedioViewState();
}

class _VedioViewState extends State<VedioView> {
  var time = '0'.obs;

  var flg = true.obs;

  Timer _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (time.value == '0') {
          timer.cancel();

          time.value = 'تم احتساب النقط';
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  time.value.toString(),
                  style: TextStyle(
                      color: KprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              );
            }),
            Container(
              height: 600,
              child: Expanded(
                child: Html(
                  data:
                      '<iframe width="560" height="600" src="https://www.youtube.com/watch?v=${widget.Veidoid}"  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
