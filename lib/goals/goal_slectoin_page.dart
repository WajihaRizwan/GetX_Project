import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/goals/get_controller.dart';

class GoalSelectionPage extends StatelessWidget {
  final GoalController controller = Get.put(GoalController());

   GoalSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "What is your goal?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "It will help us to choose a best program for you",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Goal Cards    
            Expanded(
              child: 
                 ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Number of goals
                  itemBuilder: (context, index) {
                    bool isSelected = controller.selectedGoal.value == index;
                    return GestureDetector(
                      onTap: () => controller.selectGoal(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 250,
                        decoration: BoxDecoration(
                          color: isSelected ? const Color.fromARGB(255, 189, 113, 224): const Color.fromARGB(255, 189, 113, 224),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "asests/Vector$index.png", // Replace with goal images
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Improve Shape",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "I have a low amount of body fat and need/want to build more muscle.",
                              style: TextStyle(fontSize: 12, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              
            ),
            const SizedBox(height: 40),
            SizedBox(height: 50,width: 250,
            // Confirm Button
         child:    ElevatedButton(
              onPressed: () => controller.confirmGoal(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: const Color(0xFF6B50F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              
              child: const Text(
                "Confirm",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          
        )],
        ),
      ),
    );
  }
}
