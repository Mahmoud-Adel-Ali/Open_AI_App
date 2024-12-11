import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_ai_app/core/hive/hive_boxs.dart';
import 'package:open_ai_app/features/chat/data/models/chat_history_id_model.dart';
import 'package:open_ai_app/features/chat/data/models/chat_model.dart';

abstract class HiveServices {
  static Future<void> init() async {
    await Hive.initFlutter();
    await openChatHistoryBox();
  }

  static Future<void> openChatHistoryBox() async {
    await Hive.openBox<ChatHistoryIdModel>(HiveBoxs.chatHistoryIdBox);
  }

  static Future<void> openChatBox({required String boxName}) async {
    await Hive.openBox<ChatModel>(boxName);
  }

  //get chat history ids
  static List<ChatHistoryIdModel> getChatHistoryIds() {
    var idsBox = Hive.box<ChatHistoryIdModel>(HiveBoxs.chatHistoryIdBox);
    List<ChatHistoryIdModel> ids = idsBox.values.toList();
    return ids;
  }

  // get chat models with id box
  static Future<List<ChatModel>> getChatsWithIdBox({
    required String boxName,
  }) async {
    await openChatBox(boxName: boxName);
    var chatBox = Hive.box<ChatModel>(boxName);
    List<ChatModel> chats = chatBox.values.toList();
    return chats;
  }
}
