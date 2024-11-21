class NotificationModel {
  String title;
  String timeAgo;
  bool isNew;

  NotificationModel({
    required this.title,
    required this.timeAgo,
    this.isNew = true,
  });
}
