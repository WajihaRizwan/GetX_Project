import 'package:get/get.dart';
import 'package:getx/ui_screen/welcome.dart';

class GoalController extends GetxController {
  var selectedGoal = 0.obs; // Default selected goal index

  // Function to update the selected goal
  void selectGoal(int index) {
    selectedGoal.value = index;
  }

  // Function to confirm the selection
  void confirmGoal() {
    if (selectedGoal.value != -1) {
      Get.snackbar(
        "Goal Confirmed",
        "You selected goal ${selectedGoal.value + 1}",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(const Welcome(username: "Pagal World"));
    } else {
      Get.snackbar(
        "No Goal Selected",
        "Please select a goal before confirming.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
