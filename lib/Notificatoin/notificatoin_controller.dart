import 'package:get/get.dart';
import 'package:getx/Notificatoin/notificatoin_model.dart';


class NotificationController extends GetxController {
  var notifications = <NotificationModel>[
    NotificationModel(title: "Hey, it's time for lunch", timeAgo: "About 1 minute ago"),
    NotificationModel(title: "Don't miss your lower body workout", timeAgo: "About 3 hours ago"),
    NotificationModel(title: "Hey, let’s add some meals for your b..", timeAgo: "About 3 hours ago"),
    NotificationModel(title: "Congratulations, You have finished A..", timeAgo: "29 May"),
    NotificationModel(title: "Hey, it's time for lunch", timeAgo: "8 April"),
    NotificationModel(title: "Ups, You have missed your Lowerbo...", timeAgo: "3 April"),
  ].obs;

  void removeNotification(int index) {
    notifications.removeAt(index);
  }
}
