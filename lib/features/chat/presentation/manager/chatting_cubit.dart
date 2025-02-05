import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_ai_app/core/api/api_keys.dart';
import 'package:open_ai_app/core/hive/hive_services.dart';

import '../../data/models/chat_history_id_model.dart';
import '../../data/models/chat_model.dart';
import 'chatting_state.dart';

class ChattingCubit extends Cubit<ChattingState> {
  ChattingCubit() : super(ChattingInitial());
  TextEditingController chatTextField = TextEditingController();
  List<XFile> imagesList = [];
  List<ChatModel> currentChat = [];
  ChatHistoryIdModel? currentChatHistoryId;
  List<ChatHistoryIdModel> chatHistoryIds = [];
  late GenerativeModel _textModel;
  String message = '';

  // Prepares the conversation by checking if images are present
  void prepareConversation() {
    if (imagesList.isEmpty) {
      sendMessageToAI();
    } else {
      sendMessageAndImagesToAI();
    }
  }

  // Sends a text message to the AI
  Future<void> sendMessageToAI() async {
    message = chatTextField.text;
    chatTextField.clear();
    emit(SendMessageToAiLoading());
    _textModel = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: ApiKeys.apiKey,
    );

    final content = [Content.text(message)];
    try {
      final GenerateContentResponse response =
          await _textModel.generateContent(content);
      final ChatModel chatModel = ChatModel(
        chatId: response.hashCode.toString(),
        message: message,
        response: response.text ?? "No Answer",
        imagesUrls: [],
        dateTime: DateTime.now(),
      );
      sendMessageToHiveAndGetAllMessage(chatModel);
      emit(SendMessageToAiSuccess());
    } on Exception catch (e) {
      chatTextField = TextEditingController(text: message);
      emit(SendMessageToAiFailure(error: e.toString()));
    }
  }

  // Sends a message with text and images to the AI
  Future<void> sendMessageAndImagesToAI() async {
    message = chatTextField.text;
    chatTextField.clear();
    emit(SendMessageToAiLoading());
    _textModel = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: ApiKeys.apiKey,
    );

    // Convert images into byte data
    final images =
        imagesList.map((image) => image.readAsBytes()).toList(growable: false);
    final imagesBytes = await Future.wait(images);

    // Create data parts for images
    final imagesParts = imagesBytes
        .map((bytes) => DataPart('image/jpeg', Uint8List.fromList(bytes)))
        .toList();

    // Create content with text and images
    final prompt = TextPart(message);
    final content = [
      Content.multi([prompt, ...imagesParts])
    ];

    try {
      final GenerateContentResponse response =
          await _textModel.generateContent(content);
      final ChatModel chatModel = ChatModel(
        chatId: response.hashCode.toString(),
        message: message,
        response: response.text ?? "No Answer",
        imagesUrls: getImagesUrls(isTextOnly: imagesList.isEmpty),
        dateTime: DateTime.now(),
      );
      sendMessageToHiveAndGetAllMessage(chatModel);
      imagesList.clear();
      emit(SendMessageToAiSuccess());
    } on Exception catch (e) {
      chatTextField = TextEditingController(text: message);
      emit(SendMessageToAiFailure(error: e.toString()));
    }
  }

  // Store message in Hive and fetch all messages
  void sendMessageToHiveAndGetAllMessage(ChatModel chatModel) {
    HiveServices.addChatModelToChatBox(
        chatModel, currentChatHistoryId!.chatHistoryId);
    getChatModelsFromHive();
  }

  // Fetch chat models from Hive storage
  void getChatModelsFromHive() {
    currentChat = HiveServices.getChatsWithIdBox(
        boxName: currentChatHistoryId!.chatHistoryId);
    if (currentChat.isNotEmpty && currentChatHistoryId?.chatName == null) {
      currentChatHistoryId?.chatName = currentChat[0].message;
    }
    emit(GetChatModelsFromHiveSuccess());
  }

  // Retrieve chat history IDs
  void getChatHistoryIds() {
    chatHistoryIds.clear();
    chatHistoryIds = HiveServices.getChatHistoryIds();
    if (chatHistoryIds.isEmpty) {
      openNewChatRoom();
      chatHistoryIds = HiveServices.getChatHistoryIds();
    }
    currentChatHistoryId = currentChatHistoryId ?? chatHistoryIds.first;
    emit(GetChatHistoryIdsSuccess());
  }

  // Open the last chat room
  Future<void> openLastChatRoom() async {
    if (chatHistoryIds.isNotEmpty) {
      await openChatRoom(chatHistoryIds.first);
    } else {
      await openNewChatRoom();
    }
  }

  // Open a specific chat room
  Future<void> openChatRoom(ChatHistoryIdModel chatHistoryIdModel) async {
    await HiveServices.openChatBox(boxName: chatHistoryIdModel.chatHistoryId);
    await setCurrentChatRoom(chatHistoryIdModel);
    emit(OpenChatRoomSuccess());
  }

  // Set the current chat room
  Future<void> setCurrentChatRoom(ChatHistoryIdModel chatHistoryId) async {
    currentChat =
        HiveServices.getChatsWithIdBox(boxName: chatHistoryId.chatHistoryId);
    currentChatHistoryId = chatHistoryId;
  }

  // Open a new chat room
  Future<void> openNewChatRoom() async {
    HiveServices.addChatHistory();
    getChatHistoryIds();
    await HiveServices.openChatBox(boxName: chatHistoryIds.first.chatHistoryId);
    resetCurrentChatRoom(chatHistoryIds.first);
    emit(OpenNewChatRoomSuccess());
  }

  // Reset the current chat room
  void resetCurrentChatRoom(ChatHistoryIdModel chatHistoryId) {
    currentChat = [];
    currentChatHistoryId = chatHistoryId;
  }

  // Delete a chat room
  void deleteChatRoom(ChatHistoryIdModel chatHistory) async {
    if (chatHistoryIds.length > 1) {
      await HiveServices.deleteChatHistory(chatHistory);
      getChatHistoryIds();
      if (chatHistory == currentChatHistoryId) {
        openLastChatRoom();
      }
    }
  }

  // Pick multiple images
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

  // Convert images from XFile to URLs
  List<String> getImagesUrls({required bool isTextOnly}) {
    List<String> imagesUrls = [];
    if (!isTextOnly) {
      for (var image in imagesList) {
        imagesUrls.add(image.path);
      }
    }
    return imagesUrls;
  }

  // Delete an image by index
  void deleteImage(XFile item) {
    imagesList.remove(item);
    emit(PickImagesSuccess());
  }

  // Clear the images list
  void clearImages() {
    imagesList.clear();
    emit(PickImagesSuccess());
  }
}
