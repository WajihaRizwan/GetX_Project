import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = "Masi Ramezanzade".obs;
  var program = "Lose a Fat Program".obs;

  var height = 180.obs;
  var weight = 65.obs;
  var age = 22.obs;

  var isNotificationEnabled = true.obs;

  void toggleNotification() {
    isNotificationEnabled.value = !isNotificationEnabled.value;
  }

  void editProfile(String newName, String newProgram) {
    userName.value = newName;
    program.value = newProgram;
  }
}
