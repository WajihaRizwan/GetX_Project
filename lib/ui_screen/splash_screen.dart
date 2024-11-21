import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/ui_screen/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC150F6), Color(0xFFEEA4CE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const SizedBox(height: 100,),
            const Text(
              "DIDPOOLFit",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Everybody Can Train",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 500),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const OnboardingScreen()); // Navigate to the next screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B50F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Get Started",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


