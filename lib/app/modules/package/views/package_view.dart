import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/data/componate.dart';
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
      appBar: defualtappBar(title: 'Packages'.tr),
      body: Obx(
        () {
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
        },
      ),
    );
  }

  Widget packageItem(BuildContext context, Package package) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                  image: AssetImage('images/PngItem1.png'),
                  fit: BoxFit.fitWidth),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Container(
                      //color: Colors.white.withOpacity(.6),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${package.title}',
                                      maxLines: 1,
                                      style: styleTextPackage.copyWith(
                                        fontSize: 12,

                                        color: KprimaryColor
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Container(
                                      //color: Colors.white.withOpacity(.6),
                                      child: Text(
                                        '${package.price} L.E',
                                        style: styleTextPackage.copyWith(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 2,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: Get.width * .5,
                      child: Center(
                        child: Container(
                            color: Colors.white.withOpacity(.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                              package.features.length,
                              (index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                      style: styleTextPackage.copyWith(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: Get.width * .9,
                  child: ElevatedButton(
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
                    style: ElevatedButton.styleFrom(primary: KprimaryColor,),
                    child: Text(
                      'Order Now'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
