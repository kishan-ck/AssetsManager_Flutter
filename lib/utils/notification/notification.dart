// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class AppNotificationHandler {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     importance: Importance.high,
//   );
//
//   static Future<void> firebaseNotificationSetup() async {
//     await Firebase.initializeApp();
//     try {
//       FirebaseMessaging.onMessage.listen(
//             (RemoteMessage message) {
//           RemoteNotification? notification = message.notification;
//           AndroidNotification? android = message.notification?.android;
//           if (notification != null && android != null) {
//             flutterLocalNotificationsPlugin.show(
//               notification.hashCode,
//               notification.title,
//               notification.body,
//               NotificationDetails(
//                 android: AndroidNotificationDetails(channel.id, channel.name, icon: 'mipmap/ic_launcher'),
//               ),
//             );
//           }
//           if (notification != null) {
//             debugPrint("Notification=====$notification");
//             flutterLocalNotificationsPlugin.show(
//               notification.hashCode,
//               notification.title,
//               notification.body,
//               const NotificationDetails(
//                 iOS: DarwinNotificationDetails(),
//               ),
//             );
//           }
//         },
//       );
//     } catch (e) {
//       debugPrint("Show Notification error == $e");
//     }
//     FirebaseMessaging.instance.getInitialMessage().then((value) {
//       if (value != null) {
//         debugPrint("DAT");
//       } else {
//         debugPrint("OUT");
//       }
//     });
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   static void showMsgHandler() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       if (notification != null) {
//         debugPrint("hello world 3");
//       }
//     }).onError((e) {
//       debugPrint('Error Notification : ....$e');
//     });
//   }
// }
