import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/data/componate.dart';
import 'package:grow/app/modules/payment/model/payment_model.dart';
import '../controllers/payment_controller.dart';
import 'package:intl/intl.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    controller.getMyPackages();
    return Scaffold(
        appBar: defualtappBar(
          title: 'My payments'.tr,
        ),
        body: Obx(() {
          return FutureBuilder(
            future: controller.paymentList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Subscribtion> paymentList = snapshot.data;

                if (paymentList.length == 0) {
                  return Center(child: Text('There are no packages'.tr));
                } else {
                  return ListView(
                      children: List.generate(
                    paymentList.length,
                    (index) => Card(
                      color: Color(0xffFFF8DE),
                      child: ExpansionTile(
                        //backgroundColor: KprimaryColor.withOpacity(.5),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${DateFormat('yyyy-MM-dd').format(paymentList.elementAt(index).date).toString()}',
                              style: TextStyle(
                                color: KprimaryColor,
                              ),
                            ),
                            Text(
                              '${paymentList.elementAt(index).price} L.E',
                              style: TextStyle(
                                color: KprimaryColor,
                              ),
                            )
                          ],
                        ),

                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset('images/youtube_baner.png'),
                                ),
                                ListTile(
                                  leading: Text(
                                    'package :'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KprimaryColor,
                                        fontSize: 18),
                                  ),
                                  title: Text(
                                      '${paymentList.elementAt(index).package}'),
                                ),
                                ListTile(
                                  leading: Text(
                                    'Date :'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KprimaryColor,
                                        fontSize: 18),
                                  ),
                                  title: Text(
                                      '${DateFormat('yyyy-MM-dd').format(paymentList.elementAt(index).date).toString()}'),
                                ),
                                ListTile(
                                  leading: Text(
                                    'subscribers :'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KprimaryColor,
                                        fontSize: 18),
                                  ),
                                  title: Text(
                                      '${paymentList.elementAt(index).subscribers ?? '0'}'),
                                ),
                                ListTile(
                                  leading: Text(
                                    'views :'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KprimaryColor,
                                        fontSize: 18),
                                  ),
                                  title: Text(
                                      '${paymentList.elementAt(index).views ?? "0"}'),
                                ),
                                ListTile(
                                  leading: Text(
                                    'status :'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KprimaryColor,
                                        fontSize: 18),
                                  ),
                                  title: Text(
                                      '${paymentList.elementAt(index).status}'),
                                ),
                                ListTile(
                                  leading: Text(
                                    'Payment :'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KprimaryColor,
                                        fontSize: 18),
                                  ),
                                  title: Text(
                                      '${paymentList.elementAt(index).price} \$'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
                }
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
}
