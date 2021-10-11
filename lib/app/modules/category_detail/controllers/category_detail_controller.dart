import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';

class CategoryDetailController extends GetxController {
  //TODO: Implement CategoryDetailController

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

  Future getCategoryDetailes(String id) async {
    ResponsModel responsModel = await WebServices().getCategoryDetailes(id: id);
      

    if (responsModel.success) {
      Response response = responsModel.data;
        print(response.bodyString);
      if (response.body['success']) {
        // response.body['data']['videos'];
        //\\data
        return response.body['data']['categories'];
      }
    }
  }

}
