import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/ui_screen/registor_2.dart';
import 'package:getx/ui_screen/registratoin_screen.dart';

class LoginController extends GetxController {
  // Form field controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive variables
  var isPasswordHidden = true.obs;
  var isLoading = false.obs;

  // Toggles password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Simulate login process
  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Input validation
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Both fields are required.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Simulate loading state
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulate a network delay

    // Simulated response
    bool loginSuccess = true; // Change this to `false` to test failure

    if (loginSuccess) {
      Get.snackbar("Success", "Login successful!",
          snackPosition: SnackPosition.BOTTOM);
      Get.to(Registor2()); // Navigate to Home Page
    } else {
      Get.snackbar("Error", "Invalid email or password.",
          snackPosition: SnackPosition.BOTTOM);
    }

    isLoading.value = false;
  }
}

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

   LoginScreen({super.key});

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
                "Hey there,\nWelcome Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 70),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password logic
                    Get.toNamed('/forgot-password'); // Navigate to Forgot Password Page
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 200),
              // Login Button
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value ? null : controller.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B50F6),
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Login",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500,),),
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
                     icon: const Icon(Icons.facebook, color: Colors.blue, size: 32),
                    onPressed: () {
                      // Add Google Sign-in Logic
                    },
                  ),
                  IconButton(
                      icon:    const Icon(Icons.g_mobiledata, color: Colors.red, size: 32),

                    onPressed: () {
                      // Add Facebook Sign-in Logic
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Get.to(RegistrationScreen()); // Navigate to Register Page
                },
                child: const Text(
                  "Don’t have an account yet? Register",
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
