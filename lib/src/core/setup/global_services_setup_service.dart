import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdigits/firebase_options.dart';
import 'package:mdigits/src/core/navigator_service/navigator_service.dart';
import 'package:mdigits/src/digit_span_tasks/config/config.dart';

class GlobalServicesSetupService {
  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> initDB() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> initCognitiveTasksConfig() async {
    Get.put(DigitSpanTaskConfig(), permanent: true);
  }

  Future<void> initNavigatorService() async {
    Get.put(NavigatorService());
  }
}
