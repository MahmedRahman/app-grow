import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/checkout/views/checkout_view.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/package_controller.dart';

class PackageView extends GetView<PackageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Views Packages'),
          centerTitle: true,
        ),
        body: GridView.count(
          childAspectRatio: 1 / 1.5,
          crossAxisCount: 2,
          children: [
            Package(),
            Package(),
            Package(),
            Package(),
          ],
        ));
  }
}

class Package extends StatelessWidget {
  const Package({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        color: Colors.red,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              '250 View',
              style: styleTextPackage.copyWith(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Text(
                  '70 L.E',
                  style: styleTextPackage.copyWith(
                      color: KprimaryColor, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Delivers Within 48 Hours',
                      style: styleTextPackage,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Real users',
                      style: styleTextPackage,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Profile Must Be Public',
                      style: styleTextPackage,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new CheckoutView(),
                  ),
                );
                //Get.toNamed(Routes.CHECKOUT);
                //
              },
              style: ElevatedButton.styleFrom(primary: Colors.white),
              child: Text(
                'Order Now',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
