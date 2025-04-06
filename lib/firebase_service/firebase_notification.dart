import 'dart:convert';
import 'package:ecomerce/firebase_service/local_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseNotifications {
  static FirebaseNotifications? _this;

  factory FirebaseNotifications() {
    _this ??= FirebaseNotifications._();
    return _this!;
  }

  FirebaseNotifications._();

  String? token;
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // Initialize LocalNotifications class
    await LocalNotifications().init();

    // Requesting permission for notifications
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Get the token for Firebase
    token = await getToken();

    // Background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // Foreground notifications handler
    foregroundNotifications();

    // Terminated state (initial launch) handling
    _handleLaunchNotification();
    // terminated
    firebaseMessagingTerminatedHandler();
  }

  static Future<String?> getToken() async {
    return messaging.getToken();
  }

  static foregroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {
        // Show the notification using LocalNotifications
        await _handleNotification(message);
      }
    });
  }

  // Handle the notification (either show with image or app icon)
  static Future<void> _handleNotification(RemoteMessage message) async {
    String title = message.notification?.title ?? "No Title";
    String body = message.notification?.body ?? "No Body";
    // If the message has an image URL, display it with an image, else use the app icon
    if (message.notification!.android?.imageUrl != null) {
      // Show notification with an image (if image URL is provided)
      await LocalNotifications().displayCustomNotification(title, body,
      imageUrl: message.notification!.android
              ?.imageUrl ); // Use an appropriate ID for the notification

          } else {
          // Display the simple notification (app icon)
          await LocalNotifications().displayCustomNotification(title, body);
          }

      }

  // Handle background notifications
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // You can call LocalNotifications to show a notification in the background too
    if (message.notification != null) {
      await _handleNotification(message);
    }
  }

  // Handle terminated state (when the app is launched from a notification)
  static void _handleLaunchNotification() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // Handle the notification when the app is opened from a terminated state
      if (message.notification != null) {
        await _handleNotification(message);
      }
    });
  }

  static Future<void> firebaseMessagingTerminatedHandler() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      await _handleNotification(initialMessage);
    }
  }
}