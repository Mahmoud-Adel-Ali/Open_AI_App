import 'package:hive/hive.dart';

part 'chat_history_id_model.g.dart';

@HiveType(typeId: 0)
class ChatHistoryIdModel extends HiveObject {
  @HiveField(0)
  final String chatHistoryId;
  @HiveField(1)
  final DateTime dateTime;
  @HiveField(2)
  String? chatName;

  ChatHistoryIdModel({
    required this.chatHistoryId,
    required this.dateTime,
    required this.chatName,
  });
}
