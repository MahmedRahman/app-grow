import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future getCategories() async {
    ResponsModel responsModel = await WebServices().getCategories();
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        return response.body['data'];
      }
    }
  }

  Future getCategoryDetailes(String id) async {
    ResponsModel responsModel = await WebServices().getCategoryDetailes(id: id);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {

        //\\data
        return response.body['data'];
      }
    }
  }
}
