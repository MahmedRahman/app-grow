import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/modules/profile/model/model_profile.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Info PresonalInfo;
  List<Balance> PresonalbalanceList;
  List<Channel> Presonalchannels;

  void getProfile() async {
    ResponsModel responsModel = await WebServices().getMyProfile();
    if (responsModel.success) {
      Response response = responsModel.data;
      final profileModel = profileModelFromJson(response.bodyString);
      PresonalInfo = profileModel.data.info;
      PresonalbalanceList = profileModel.data.balance;
      Presonalchannels = profileModel.data.channels;
    }
  }
}
