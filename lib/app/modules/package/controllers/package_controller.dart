import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/modules/package/model/package_model.dart';

class PackageController extends GetxController {
  //TODO: Implement PackageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getPackage();
  }

  var pakcageslList = Future.value().obs;

  getPackage() async {
    ResponsModel responsModel = await WebServices().getShowPakcages();
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        final pakcageslListModel =
            pakcageslListModelFromJson(response.bodyString);
        pakcageslList.value = Future.value(pakcageslListModel.packages);


      }
    }
  }
}
