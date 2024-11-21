import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/ui_screen/login_screen.dart';

class RegisterController extends GetxController {
  // Form field controllers
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive variables
  var isPasswordHidden = true.obs;
  var isTermsAccepted = false.obs;
  var isLoading = false.obs;

  // Toggles password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Simulate backend registration process
  Future<void> register() async {
    String fullName = fullNameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Input validation
    if (fullName.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "All fields are required.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (!isTermsAccepted.value) {
      Get.snackbar("Error", "You must accept the terms and conditions.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Simulate loading state
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate a network delay

    // Simulated response
    bool registrationSuccess = true; // Change this to `false` to simulate failure

    if (registrationSuccess) {
      Get.snackbar("Success", "Account created successfully!",
          snackPosition: SnackPosition.BOTTOM);
      Get.to(LoginScreen()); // Navigate to login page
    } 

    isLoading.value = false;
  }
}

class RegistrationScreen extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

   RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hey there,\nCreate an Account",
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              // Full Name Field
              TextField(
                controller: controller.fullNameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Phone Number Field
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Email Field
              TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Password Field
              Obx(
                () => TextField(
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(controller.isPasswordHidden.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Terms and Conditions Checkbox
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.isTermsAccepted.value,
                      onChanged: (value) {
                        controller.isTermsAccepted.value = value!;
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.isTermsAccepted.value =
                          !controller.isTermsAccepted.value,
                      child: const Text(
                        "By continuing, you accept our Privacy Policy and Terms of Use",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),
              // Register Button
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B50F6),
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Register",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500,),),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Or"),
              const SizedBox(height: 16),
              // Social Media Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.g_mobiledata,
                        color: Colors.red, size: 32),
                    onPressed: () {
                      // Add Google Sign-in Logic
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.facebook,
                        color: Colors.blue, size: 32),
                    onPressed: () {
                      // Add Facebook Sign-in Logic
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/login'); // Navigate to Login Page
                },
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
