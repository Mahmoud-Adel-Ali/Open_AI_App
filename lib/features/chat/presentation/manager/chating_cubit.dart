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
  List<XFile>? imagesList = [];
  List<ChatModel> currentChat = [];
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
    emit(GetChatHistoryIdsSuccess());
  }

  //open last chat room
  Future<void> openLastChatRoom() async {
    if (chatHistoryIds.isNotEmpty) {
      await openChatRoom(chatHistoryIds.first.chatHistoryId);
    } else {
      await openNewChatRoom();
    }
  }

  //open any founded chat room
  Future<void> openChatRoom(String chatHistoryId) async {
    await HiveServices.openChatBox(boxName: chatHistoryId);
    await setCurrentChatRoom(chatHistoryId);
    emit(OpenChatRoomSuccess());
  }

  Future<void> setCurrentChatRoom(String chatHistoryId) async {
    currentChat = await HiveServices.getChatsWithIdBox(boxName: chatHistoryId);
  }

  //open new chat room
  Future<void> openNewChatRoom() async {
    HiveServices.addChatHistory();
    getChatHistoryIds();
    await HiveServices.openChatBox(boxName: chatHistoryIds.first.chatHistoryId);
    resetCurrentChatRoom();
    emit(OpenNewChatRoomSuccess());
  }

  void resetCurrentChatRoom() {
    currentChat = [];
  }

  void deleteChatRoom(ChatHistoryIdModel chatHistory) async {
    if (chatHistoryIds.length > 1)
      {
      await HiveServices.deleteChatHistory(chatHistory);
      getChatHistoryIds();
    }
  }

// upload image to AI model
// pick multiple image
  Future<void> pickImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage(
      imageQuality: 95,
      maxHeight: 800,
      maxWidth: 800,
    );
    if (images.isNotEmpty) {
      imagesList = imagesList ?? [];
      imagesList!.addAll(images);
      emit(PickImagesSuccess());
    }
  }

//delete image by index
  void deleteImage(int index) {
    imagesList!.removeAt(index);
    emit(PickImagesSuccess());
  }

  //clear images list
  void clearImages() {
    imagesList!.clear();
    emit(PickImagesSuccess());
  }
}
