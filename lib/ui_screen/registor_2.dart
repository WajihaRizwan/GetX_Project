import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/goals/goal_slectoin_page.dart';


class ProfileController extends GetxController {
  // Reactive variables
  var selectedGender = ''.obs;
  var dateOfBirth = ''.obs;
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  // Show a date picker for the date of birth
  Future<void> selectDateOfBirth(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dateOfBirth.value = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  // Save and validate the profile details
  void saveProfile() {
    String weight = weightController.text.trim();
    String height = heightController.text.trim();

    if (selectedGender.value.isEmpty) {
      Get.snackbar("Error", "Please select your gender.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (dateOfBirth.value.isEmpty) {
      Get.snackbar("Error", "Please select your date of birth.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (weight.isEmpty || height.isEmpty) {
      Get.snackbar("Error", "Weight and Height are required.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Navigate to the next screen (e.g., HomeScreen or Dashboard)
    Get.snackbar("Success", "Profile completed successfully!",
        snackPosition: SnackPosition.BOTTOM);
    Get.to(GoalSelectionPage()); // Replace with your actual route
  }
}

class Registor2 extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

   Registor2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image/Illustration
              SizedBox(
                height: 200,
                child: Image.asset(
                  'asests/Vector-Section (1).png', // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              // Title
              const Text(
                "Let's complete your profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "It will help us to know more about you!",
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),

              // Gender Dropdown
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedGender.value.isEmpty
                      ? null
                      : controller.selectedGender.value,
                  onChanged: (value) {
                    controller.selectedGender.value = value!;
                  },
                  items: ["Male", "Female", "Other"]
                      .map((gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  decoration: const InputDecoration(
                    labelText: "Choose Gender",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Date of Birth Picker
              Obx(
                () => TextField(
                  readOnly: true,
                  onTap: () => controller.selectDateOfBirth(context),
                  decoration: InputDecoration(
                    labelText: controller.dateOfBirth.value.isEmpty
                        ? "Date of Birth"
                        : controller.dateOfBirth.value,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Weight Input
              TextField(
                controller: controller.weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Your Weight",
                  border: OutlineInputBorder(),
                  suffixText: "KG",
                  prefixIcon: Icon(Icons.fitness_center),
                ),
              ),
              const SizedBox(height: 16),

              // Height Input
              TextField(
                controller: controller.heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Your Height",
                  border: OutlineInputBorder(),
                  suffixText: "CM",
                  prefixIcon: Icon(Icons.height),
                ),
              ),
              const SizedBox(height: 40),

              // Next Button
              ElevatedButton(
                onPressed: controller.saveProfile,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
