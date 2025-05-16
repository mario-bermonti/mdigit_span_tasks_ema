import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// This fake provider is needed to mock the path provider in tests that rely on GetStorage.
class FakePathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String> getApplicationDocumentsPath() async {
    final Directory tempDir = await Directory.systemTemp.createTemp();
    return p.join(tempDir.path, 'app_documents');
  }
}
