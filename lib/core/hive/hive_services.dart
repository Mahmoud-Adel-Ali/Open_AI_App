import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_ai_app/core/hive/hive_boxs.dart';
import 'package:open_ai_app/features/chat/data/models/chat_history_id_model.dart';
import 'package:open_ai_app/features/chat/data/models/chat_model.dart';
import 'package:uuid/uuid.dart';

abstract class HiveServices {
  static void registerAdapters() {
    Hive.registerAdapter(ChatHistoryIdModelAdapter());
    Hive.registerAdapter(ChatModelAdapter());
  }

  static Future<void> init() async {
    await Hive.initFlutter();
    await openChatHistoryBox();
  }

  // chat history methods
  static Future<void> openChatHistoryBox() async {
    await Hive.openBox<ChatHistoryIdModel>(HiveBoxs.chatHistoryIdBox);
  }

  static addChatHistory() {
    String id = const Uuid().v7();
    ChatHistoryIdModel chatHistory = ChatHistoryIdModel(
      chatHistoryId: id,
      dateTime: DateTime.now(),
      chatName: null,
    );
    var idsBox = Hive.box<ChatHistoryIdModel>(HiveBoxs.chatHistoryIdBox);
    idsBox.add(chatHistory);
  }

  static Future<void> deleteChatHistory(ChatHistoryIdModel chatHistory) async {
    await openChatBox(boxName: chatHistory.chatHistoryId);
    await Hive.box<ChatModel>(chatHistory.chatHistoryId).clear();
    await chatHistory.delete();
  }

  //get chat history ids
  static List<ChatHistoryIdModel> getChatHistoryIds() {
    var idsBox = Hive.box<ChatHistoryIdModel>(HiveBoxs.chatHistoryIdBox);
    List<ChatHistoryIdModel> ids = idsBox.values.toList();
    ids = ids.reversed.toList();
    if (ids.length > 20) {
      for (int i = 20; i < ids.length; i++) {
        deleteChatHistory(ids[i]);
      }
      return ids.sublist(0, 20);
    }
    return ids;
  }

  //chat boxs
  static Future<void> openChatBox({required String boxName}) async {
    await Hive.openBox<ChatModel>(boxName);
  }

  static addChatModelToChatBox(ChatModel chatModel, String boxName) {
    var chatBox = Hive.box<ChatModel>(boxName);
    chatBox.add(chatModel);
  }

  // get chat models with id box
  static List<ChatModel> getChatsWithIdBox({
    required String boxName,
  }) {
    // await openChatBox(boxName: boxName);
    var chatBox = Hive.box<ChatModel>(boxName);
    List<ChatModel> chats = chatBox.values.toList();
    return chats;
  }
}
