import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  List<String> ServicesLogo = [
    'images/yt.png',
    'images/inst.png',
    'images/fb.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My payments'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: payment(
              ServicesLogo: ServicesLogo[0],
            ),
          ),
          Card(
            child: payment(
              ServicesLogo: ServicesLogo[1],
            ),
          ),
          Card(
            child: payment(
              ServicesLogo: ServicesLogo[2],
            ),
          )
        ],
      ),
    );
  }
}

class payment extends StatelessWidget {
  const payment({
    Key key,
    this.ServicesLogo,
  }) : super(key: key);
  final String ServicesLogo;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.bottomSheet(
          Container(
            color: KaccentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Package Name'),
                    subtitle: Text('Facebook Comments'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Date of purchase'),
                    subtitle: Text('15 April 2021'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('amount'),
                    subtitle: Text('150'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Status'),
                    subtitle: Text('processing'),
                  ),
                  Divider(),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: KprimaryColor
                      ),
                      onPressed: () {},
                      child: Text('Order again'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      title: Text('15 April 2021'),
      subtitle: Text('150 \$'),
      leading: Image.asset(ServicesLogo,width: 32,),
      trailing: Icon(Icons.more_vert),
    );
  }
}
