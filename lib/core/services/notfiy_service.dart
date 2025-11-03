import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;

class NotifyService {
  static final plugin = FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    final androidPlugin =
        plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    await androidPlugin?.requestNotificationsPermission();

    await _setTimeLocalZone();

    const androidInit = AndroidInitializationSettings("@mipmap/appicon");
    final iOSInit = const DarwinInitializationSettings();
    final settings = InitializationSettings(android: androidInit, iOS: iOSInit);

    await plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: _onDidReceive,
      onDidReceiveBackgroundNotificationResponse: _onDidReceive,
    );
  }

  static Future<void> _setTimeLocalZone() async {
    tzdata.initializeTimeZones();
    try {
      final tzName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(tzName));
    } catch (e) {
      tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    }
  }

  static void _onDidReceive(NotificationResponse details) async {
    if (details.actionId == 'STOP_ADHAN') {
      await plugin.cancel(details.id ?? 0);
    }
  }

  static Future<void> showScheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? adhanSound,
  }) async {
    tz.TZDateTime tzTime = tz.TZDateTime.from(scheduledDate, tz.local);

    final nowTz = tz.TZDateTime.now(tz.local);
    if (tzTime.isBefore(nowTz)) {
      tzTime = tzTime.add(const Duration(days: 1));
    }

    final androidDetails = AndroidNotificationDetails(
      'prayer_channel',
      'Prayer Times',
      channelDescription: 'Prayer Time Notifications',
      sound: RawResourceAndroidNotificationSound(adhanSound ?? 'adhan3'),
      playSound: true,
      enableLights: true,
      importance: Importance.max,
      priority: Priority.high,
      actions: <AndroidNotificationAction>[
        const AndroidNotificationAction(
          'STOP_ADHAN',
          'إيقاف الأذان',
          showsUserInterface: true,
        ),
      ],
    );

    await plugin.zonedSchedule(
      id,
      title,
      body,
      tzTime,
      NotificationDetails(android: androidDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await plugin.cancel(id);
  }

  static Future<void> cancelAllNotifications() async {
    await plugin.cancelAll();
  }
}
