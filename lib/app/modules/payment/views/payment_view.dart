import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/payment/model/payment_model.dart';
import '../controllers/payment_controller.dart';
import 'package:intl/intl.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentController controller = Get.put(PaymentController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My payments',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          return FutureBuilder(
            future: controller.paymentList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Subscribtion> paymentList = snapshot.data;
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
                                child: Image.asset('images/youtube_baner.png'),
                              ),
                              ListTile(
                                leading: Text(
                                  'Date :',
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
                                  'subscribers :',
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
                                  'status :',
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
                                  'Payment :',
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
