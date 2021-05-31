import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/checkout/views/checkout_view.dart';
import 'package:grow/app/modules/package/model/package_model.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/package_controller.dart';

class PackageView extends GetView<PackageController> {



  PackageController controller = Get.put(PackageController());

  @override
  Widget build(BuildContext context) {
    controller.getPackage();
    return Scaffold(
        appBar: AppBar(
          title: Text('Packages'),
          centerTitle: true,
        ),
        body: Obx(() {
          return FutureBuilder(
            future: controller.pakcageslList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Package> PackageLit = snapshot.data;
                return GridView.count(
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 2,
                  children: List.generate(
                    PackageLit.length,
                    (index) => packageItem(
                      context,
                      PackageLit.elementAt(index),
                    ),
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
        }));
  }

  Widget packageItem(BuildContext context, Package package) {
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
              '${package.target}',
              style: styleTextPackage.copyWith(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Text(
                  '${package.price} L.E',
                  style: styleTextPackage.copyWith(
                      color: KprimaryColor, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(package.features.length, (index) {
                  return Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${package.features.elementAt(index)}',
                        style: styleTextPackage,
                      ),
                    ],
                  );
                })),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new CheckoutView(package),
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
