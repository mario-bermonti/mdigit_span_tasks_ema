import 'package:firebase_messaging/firebase_messaging.dart';

/// Service that configures and manages remote notifications
///
/// It currently uses Firebase Cloud Messaging (FCM) for remote notifications
class RemoteNotifications {
  final FirebaseMessaging remoteNotifications = FirebaseMessaging.instance;
  late RemoteMessage? _initialMessage;

  RemoteMessage? get initialMessage {
    RemoteMessage? message = _initialMessage;
    _initialMessage = null;
    return message;
  }

  /// Returns the token used to send remote notifications to user.
  Future<String?> getToken() async => await remoteNotifications.getToken();

  /// Ask permissions and subscribe to remote notifications.
  ///
  /// Only needs to be called once.
  Future<void> setup() async {
    /// options only apply to ios
    await remoteNotifications.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    await subscribeToEMAReminders();
  }

  /// Setups up how notifications will be handled.
  Future<void> init({
    required Future<void> Function(RemoteMessage message)
        onForegroundNotification,
    required Function(dynamic message) onNotificationTap,
  }) async {
    print('token: ${await getToken()}');

    /// ios specific
    await remoteNotifications.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    /// handle notifications while app is in the foreground
    FirebaseMessaging.onMessage.listen(((RemoteMessage message) async {
      await onForegroundNotification(message);
    }));

    _initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    /// handle notifications while app is in the background
    FirebaseMessaging.onMessageOpenedApp
        .listen(((RemoteMessage message) => onNotificationTap(message)));
  }

  /// Subscribes to the remote notification topic specified by [topic].
  Future<void> subscribeToTopic({required String topic}) async {
    await remoteNotifications.subscribeToTopic(topic);
  }

  /// Subscribes to the remote topic for EMA reminders.
  Future<void> subscribeToEMAReminders() async {
    await subscribeToTopic(topic: 'ema_reminders');
  }
}
