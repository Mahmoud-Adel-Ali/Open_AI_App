// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'chat_history_id_model.g.dart';

@HiveType(typeId: 0)
class ChatHistoryIdModel extends HiveObject {
  @HiveField(0)
  final String chatHistoryId;
  @HiveField(1)
  final DateTime dateTime;

  ChatHistoryIdModel({required this.chatHistoryId, required this.dateTime});
}
