import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdigits/firebase_options.dart';
import 'package:mdigits/src/core/navigator_service/navigator_service.dart';
import 'package:mdigits/src/digit_span_tasks/config/config.dart';

/// TODO is there a better way to organize this functionality?
class GlobalServicesSetupService {
  Future<void> initGlobalServices() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put(DigitSpanTaskConfig(), permanent: true);
    Get.put(NavigatorService());
  }
}
