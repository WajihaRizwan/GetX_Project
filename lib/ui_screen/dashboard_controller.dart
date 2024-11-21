import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Notificatoin/notificatoin_controller.dart';
import 'package:getx/Notificatoin/notificatoin_model.dart';
import 'package:getx/Notificatoin/notificatoin_screen.dart';
import 'package:getx/Profile/profile_screen.dart';

class DashboardController extends GetxController {
  // Reactive variables for health stats
  var heartRate = 78.obs;
  var waterIntake = 4.0.obs; // In liters
  var sleepTime = "8h 20m".obs;
  var caloriesBurned = 760.obs;
  var caloriesLeft = 230.obs;

  // Weekly workout progress
  var workoutProgress = [
    40.0,  // Sunday
    50.0,  // Monday
    60.0,  // Tuesday
    80.0,  // Wednesday
    20.0,  // Thursday
    90.0,  // Friday
    30.0   // Saturday
  ].obs;

  // Latest workouts
  var latestWorkouts = [
    {"name": "Fullbody Workout", "calories": 180, "duration": "20 minutes", "progress": 80},
    {"name": "Lowerbody Workout", "calories": 200, "duration": "30 minutes", "progress": 60},
    {"name": "Ab Workout", "calories": 150, "duration": "20 minutes", "progress": 40},
  ].obs;

  // Simulate updating stats
  void updateHeartRate() => heartRate.value = 72 + (DateTime.now().second % 10);
  void updateWaterIntake() => waterIntake.value += 0.5;
  void updateCalories() {
    caloriesBurned.value += 50;
    caloriesLeft.value -= 50;
  }
}

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

   DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back,", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text("Masi Ramezanzade", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {
              Get.to( NotificationScreen());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BMI Card
            _buildBMICard(),
            _buildTodayTargetCard(),

            const SizedBox(height: 20),
            const Text("Activity Status", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            // Activity Cards
            _buildActivityStatusCards(),

            const SizedBox(height: 20),
            // Workout Progress
            const Text("Workout Progress", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            _buildWorkoutProgress(),

            const SizedBox(height: 20),
            // Latest Workout
            _buildLatestWorkout(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // BMI Card
  Widget _buildBMICard() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BMI (Body Mass Index)",
                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "You have a normal weight",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          Text(
            "20.1",
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ],
      ),
    );
  }

  // Today's Target Card
  Widget _buildTodayTargetCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.purple.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Today Target",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ElevatedButton(
            onPressed: () => Get.snackbar("Today's Target", "Keep working on your daily goals!"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("Check"),
          ),
        ],
      ),
    );
  }

  // Activity Status Cards
  Widget _buildActivityStatusCards() {
    return Column(
      children: [
        Obx(() => Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Heart Rate", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      Text("${controller.heartRate.value} BPM", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const Text("3 mins ago", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  IconButton(icon: const Icon(Icons.refresh, color: Colors.red), onPressed: controller.updateHeartRate),
                ],
              ),
            )),
        Row(
          children: [
            _buildSmallCard("Water Intake", "${controller.waterIntake.value} Liters", Colors.blue),
            _buildSmallCard("Sleep", controller.sleepTime.value, Colors.green),
            _buildSmallCard("Calories", "${controller.caloriesBurned.value} kcal", Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Workout Progress
  Widget _buildWorkoutProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: controller.workoutProgress.map((value) {
                  return Expanded(
                    child: Container(
                      height: value,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      color: Colors.purple,
                    ),
                  );
                }).toList(),
              ),
            )),
      ],
    );
  }

  // Latest Workout Section
  Widget _buildLatestWorkout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Latest Workout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("See more", style: TextStyle(color: Colors.purple)),
          ],
        ),
        const SizedBox(height: 10),
        Obx(() => Column(
              children: controller.latestWorkouts.map((workout) {
                return ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.purple.shade50, child: const Icon(Icons.fitness_center, color: Colors.purple)),
                  title: const Text('name'),
                  subtitle: Text("${workout['calories']} Calories Burn | ${workout['duration']}"),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400, size: 16),
                );
              }).toList(),
            )),
      ],
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      onTap: (index) {
        Get.to( ProfileScreen());
      },
    );
  }
}
