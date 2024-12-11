import 'package:hive/hive.dart';
part 'chat_history_id_model.g.dart';

@HiveType(typeId: 0)
class ChatHistoryIdModel extends HiveObject {
  @HiveField(0)
  final String chatHistoryId;

  ChatHistoryIdModel({required this.chatHistoryId});
}
