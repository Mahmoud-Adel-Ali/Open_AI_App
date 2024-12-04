import 'package:flutter/material.dart';
import 'package:open_ai_app/core/database/cache_helper.dart';
import 'open_ai_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const OpenAiApp());
}
