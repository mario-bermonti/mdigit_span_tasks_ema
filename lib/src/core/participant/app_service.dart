import 'package:package_info_plus/package_info_plus.dart';

/// Service that provides info about the app.
class AppService {
  final PackageInfo _packageInfo;

  AppService({required PackageInfo packageInfo}) : _packageInfo = packageInfo;

  static Future<AppService> init() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return AppService(packageInfo: packageInfo);
  }

  String get appVersion => _packageInfo.version;
  String get appBuildNumber => _packageInfo.buildNumber;
}
