

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/home/views/home_view.dart';
import 'package:grow/app/modules/package/model/package_model.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
/////////////////////////////
  Package package;
  CheckoutView(this.package);
  CheckoutController controller = Get.put(CheckoutController());
  /////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
       
       
            SizedBox(
              height: 5,
            ),
            Text(
              '  Your Copon Code',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 10,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: ' copon code',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: KprimaryColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: KprimaryColor),
                      onPressed: () {},
                      child: Text(
                        'Done',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: Get.width,
                color: Colors.red,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${package.subscribers} View',
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
                        children: List.generate(
                          package.features.length,
                          (index) => Row(
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
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Totall : ${package.price} L.E',
                      style: styleTextPackage.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            Text(
              'Payment',
              style: styleTextTitle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('images/paypal.png'),
                Image.asset('images/wallet.png'),
                Image.asset('images/master.png'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.setPackageSubscribe(package.id.toString(),context);
              },
              child: Text('Complete Your Order'),
              style: ElevatedButton.styleFrom(primary: KprimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
