import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class LocalNotifications {
  static final LocalNotifications _instance = LocalNotifications._();

  factory LocalNotifications() => _instance;

  LocalNotifications._();

  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _requestPermissions();

    const AndroidInitializationSettings androidInitSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosInitSettings =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    await createNotificationChannel();
    // التحقق مما إذا تم فتح التطبيق من إشعار
    final details = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();

    if (details?.didNotificationLaunchApp ?? false) {
      final payload = details?.notificationResponse?.payload;
      if (payload != null) {
        // navigatorKey.currentState?.pushNamed(Routes.notificationScreen);
      }
    }
  }

  Future<void> _requestPermissions() async {
    // iOS permissions
    final iosPermissionGranted = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    // Android 13+ permissions
    final androidPermissionGranted = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (iosPermissionGranted == false || androidPermissionGranted == false) {
      print("Notification permissions denied.");
    }
  }

  Future<void> createNotificationChannel() async {
    const AndroidNotificationChannel androidNotificationChannel =
    AndroidNotificationChannel(
      'default_channel',
      'General Notifications',
      description: 'Notifications for general app updates or alerts',
      importance: Importance.high,
      playSound: true,
    );

    final existingChannels = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.getNotificationChannels();

    if (existingChannels != null &&
        !existingChannels.any((channel) => channel.id == 'default_channel')) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidNotificationChannel);
    }
  }

  Future<void> displayCustomNotification(String title, String body,
      {String? imageUrl, String? payload}) async {
    try {
      AndroidNotificationDetails androidDetails;
      String? attachmentPicturePath;
      if (imageUrl != null && imageUrl.isNotEmpty) {
        attachmentPicturePath =
        await _downloadAndSaveFile(imageUrl, 'attachment_img.jpg');
        final bigPicture = BigPictureStyleInformation(
          FilePathAndroidBitmap(attachmentPicturePath),
          contentTitle: title,
          summaryText: body,
          htmlFormatContentTitle: true,
          htmlFormatSummaryText: true,
        );
        androidDetails = AndroidNotificationDetails(
          'default_channel',
          'General Notifications',
          channelDescription: 'Notifications for general app updates or alerts',
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: bigPicture,
        );
      } else {
        androidDetails = AndroidNotificationDetails(
          'default_channel',
          'General Notifications',
          channelDescription: 'Notifications for general app updates or alerts',
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(
            body,
            htmlFormatBigText: true,
            htmlFormatContentTitle: true,
          ),
        );
      }

      final DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        attachments: imageUrl != null && imageUrl.isNotEmpty
            ? [DarwinNotificationAttachment(attachmentPicturePath ?? "")]
            : null,
      );

      final NotificationDetails platformDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );
      await _flutterLocalNotificationsPlugin.show(
        title.hashCode,
        title,
        body,
        platformDetails,
        payload: payload,
      );
    } catch (e) {
      print("Error displaying notification: $e");
    }
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
    if (notificationResponse.payload != null) {
      try {
        // navigatorKey.currentState?.pushNamed(
        //   Routes.notificationScreen,
        // );
      } catch (e) {
        print("Error processing notification payload: $e");
      }
    }
  }


  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final file = File(filePath);
      await file.writeAsBytes(response.data);
      return filePath;
    } catch (e) {
      print("Error downloading image: $e");
      return "";
    }
  }
  Future<NotificationResponse?> getLaunchNotificationDetails() async {
    final details = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    return details?.notificationResponse;
  }
}
