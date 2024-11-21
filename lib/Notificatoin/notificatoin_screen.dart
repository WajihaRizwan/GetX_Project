import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Notificatoin/notificatoin_controller.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

   NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Add functionality if needed
            },
          ),
        ],
      ),
      body: 
         ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.notifications, color: Colors.white),
              ),
              title: Text(notification.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              subtitle: Text(notification.timeAgo),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  if (value == 'delete') {
                    controller.notifications();
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'delete', child: Text('Delete')),
                ],
              ),
            );
          },
        )
      
    );
  }
}
