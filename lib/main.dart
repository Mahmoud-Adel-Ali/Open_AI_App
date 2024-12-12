import 'package:flutter/material.dart';
import 'package:open_ai_app/core/database/cache_helper.dart';
import 'package:open_ai_app/core/hive/hive_services.dart';
import 'open_ai_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveServices.registerAdapters();
  await CacheHelper().init();
  await HiveServices.init();
  runApp(const OpenAiApp());
}
