import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/ui_screen/dashboard_controller.dart';



class Welcome extends StatelessWidget {
  final String username;

  // Constructor to accept the username
  const Welcome({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Illustration or Image
            Container(
              margin: const EdgeInsets.only(top: 120),
              child: Image.asset(
                'asests/Group (2).png', // Replace with your asset path
                height: 250,
              ),
            ),
            const SizedBox(height: 40),

            // Welcome Text
            Text(
              "Welcome, $username",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Subtext
            const Text(
              "You are all set now, let's reach your goals together with us",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            // Go to Home Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Home Screen
                  Get.to(DashboardScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B50F6),
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                child: const Text(
                  "Go To Home",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


