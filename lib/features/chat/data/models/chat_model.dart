import 'package:hive/hive.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 1)
class ChatModel extends HiveObject {
  @HiveField(0)
  final String chatId;
  @HiveField(1)
  final String message;
  @HiveField(2)
  final String response;
  @HiveField(3)
  final List<String> imagesUrls;
  @HiveField(4)
  final DateTime dateTime;

  ChatModel({
    required this.chatId,
    required this.message,
    required this.response,
    required this.imagesUrls,
    required this.dateTime,
  });
}
