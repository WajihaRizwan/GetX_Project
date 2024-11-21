import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Additional options here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => Text(
                        controller.userName.value,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Obx(() => Text(
                        controller.program.value,
                        style: const TextStyle(color: Colors.grey),
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _showEditDialog(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Text("Edit",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileStats(),
            _buildSection("Account", [
              _buildListItem(Icons.person, "Personal Data"),
              _buildListItem(Icons.star, "Achievement"),
              _buildListItem(Icons.history, "Activity History"),
              _buildListItem(Icons.fitness_center, "Workout Progress"),
            ]),
            _buildSection("Notification", [
              Obx(() => SwitchListTile(
                    title: const Text("Pop-up Notification"),
                    value: controller.isNotificationEnabled.value,
                    onChanged: (value) {
                      controller.toggleNotification();
                    },
                  )),
            ]),
            _buildSection("Other", [
              _buildListItem(Icons.contact_support, "Contact Us"),
              _buildListItem(Icons.privacy_tip, "Privacy Policy"),
              _buildListItem(Icons.settings, "Settings"),
            ]),
          ],
        ),
      ),

      );
  }

  Widget _buildProfileStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() => _buildStat("Height", "${controller.height.value}cm")),
          Obx(() => _buildStat("Weight", "${controller.weight.value}kg")),
          Obx(() => _buildStat("Age", "${controller.age.value}yo")),
        ],
      ),
    );
  }

  Widget _buildStat(String title, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildListItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      onTap: () {
        // Handle navigation
      },
    );
  }

  void _showEditDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController programController = TextEditingController();

    nameController.text = controller.userName.value;
    programController.text = controller.program.value;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: programController,
                decoration: const InputDecoration(labelText: "Program"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.editProfile(nameController.text, programController.text);
                Get.back();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
