import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  setPackageSubscribe(String Packagid) async {
    ResponsModel responsModel = await WebServices().setPackageSubscribe(Packagid);
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        Get.snackbar('', 'Payment Done');
/*
              Navigator.pushAndRemoveUntil(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new HomeView(),
                  ),(route) => false
                );
*/
      } else {
              Get.snackbar('', 'Payment Not Done');
      }
    }
  }
}
