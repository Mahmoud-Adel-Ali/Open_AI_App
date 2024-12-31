import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_ai_app/core/api/api_keys.dart';
import 'package:open_ai_app/core/hive/hive_services.dart';
import 'package:open_ai_app/features/chat/data/models/chat_history_id_model.dart';
import 'package:open_ai_app/features/chat/data/models/chat_model.dart';

import 'chating_state.dart';

class ChatingCubit extends Cubit<ChatingState> {
  ChatingCubit() : super(ChatingInitial());
  TextEditingController chatTextFeild = TextEditingController();
  List<XFile> imagesList = [];
  List<ChatModel> currentChat = [];
  ChatHistoryIdModel? currentChatHistoryId;
  List<ChatHistoryIdModel> chatHistoryIds = [];
  // generative model for the text
  late GenerativeModel _textModel;
  Future<void> sendMessageToAI() async {
    _textModel = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: ApiKeys.apiKey,
    );

    final content = [Content.text(chatTextFeild.text)];
    final GenerateContentResponse response =
        await _textModel.generateContent(content);
    final ChatModel chatModel = ChatModel(
      chatId: response.hashCode.toString(),
      message: chatTextFeild.text,
      response: response.text ?? "No Answer",
      imagesUrls: [],
      dateTime: DateTime.now(),
    );
    currentChat.add(chatModel);
    emit(AddNewChatModel());
  }

  //get chat history ids
  void getChatHistoryIds() {
    chatHistoryIds.clear();
    chatHistoryIds = HiveServices.getChatHistoryIds();
    currentChatHistoryId = currentChatHistoryId ?? chatHistoryIds.first;
    emit(GetChatHistoryIdsSuccess());
  }

  //open last chat room
  Future<void> openLastChatRoom() async {
    if (chatHistoryIds.isNotEmpty) {
      await openChatRoom(chatHistoryIds.first);
    } else {
      await openNewChatRoom();
    }
  }

  //open any founded chat room
  Future<void> openChatRoom(ChatHistoryIdModel chatHistoryIdModel) async {
    await HiveServices.openChatBox(boxName: chatHistoryIdModel.chatHistoryId);
    await setCurrentChatRoom(chatHistoryIdModel);
    emit(OpenChatRoomSuccess());
  }

  Future<void> setCurrentChatRoom(ChatHistoryIdModel chatHistoryId) async {
    currentChat = await HiveServices.getChatsWithIdBox(
        boxName: chatHistoryId.chatHistoryId);
    currentChatHistoryId = chatHistoryId;
  }

  //open new chat room
  Future<void> openNewChatRoom() async {
    HiveServices.addChatHistory();
    getChatHistoryIds();
    await HiveServices.openChatBox(boxName: chatHistoryIds.first.chatHistoryId);
    resetCurrentChatRoom(chatHistoryIds.first);
    emit(OpenNewChatRoomSuccess());
  }

  void resetCurrentChatRoom(ChatHistoryIdModel chatHistoryId) {
    currentChat = [];
    currentChatHistoryId = chatHistoryId;
  }

  void deleteChatRoom(ChatHistoryIdModel chatHistory) async {
    if (chatHistoryIds.length > 1) {
      await HiveServices.deleteChatHistory(chatHistory);
      getChatHistoryIds();
      if (chatHistory == currentChatHistoryId) {
        openLastChatRoom();
      }
    }
  }

  // pick multiple image
  Future<void> pickImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage(
      imageQuality: 95,
      maxHeight: 800,
      maxWidth: 800,
      limit: 2,
    );
    if (images.isNotEmpty) {
      clearImages();
      imagesList.addAll(images);
      emit(PickImagesSuccess());
    }
  }

  //delete image by index
  void deleteImage(XFile item) {
    imagesList.remove(item);
    emit(PickImagesSuccess());
  }

  //clear images list
  void clearImages() {
    imagesList.clear();
    emit(PickImagesSuccess());
  }
}
