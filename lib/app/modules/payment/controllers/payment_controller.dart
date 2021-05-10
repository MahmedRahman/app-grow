import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/modules/payment/model/payment_model.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

  var paymentList = Future.value().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void getMyPackages() async {
    ResponsModel responsModel = await WebServices().getMyPackages();
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        final paymentModel = paymentModelFromJson(response.bodyString);
        paymentList.value = Future.value(paymentModel.subscribtions);
      }
    }
  }
}
