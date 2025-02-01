import 'dart:developer';
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
  // generative model for the text
  late GenerativeModel _textModel;
  String message = '';
  prepareConversation() {
    if (imagesList.isEmpty) {
      sendMessageToAI();
    } else {
      sendMessageAndImagesToAI();
    }
  }

  // only text
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

// text and images
  Future<void> sendMessageAndImagesToAI() async {
    message = chatTextField.text;
    chatTextField.clear();
    emit(SendMessageToAiLoading());
    _textModel = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: ApiKeys.apiKey,
    );

    // generate image from input message
    // handles both text and images in this case

    // 0 - To work with the image data in a format suitable for processing or sending over a network
    // 1-  converting each image into byte data
    final images = imagesList
        .map(
          (image) => image.readAsBytes(),
        )
        .toList(growable: false);

    // 2- waits for all image reading operations to complete
    final imagesBytes = await Future.wait(images);

    // 3- creates a list of DataPart objects, where each image is represented in image/jpeg format
    // DataPart : package the byte data along with other information,
    // such as the file type (in this case, 'image/jpeg'),
    // Each DataPart represents an individual image with its byte data and its format.
    final imagesParts = imagesBytes
        .map((bytes) => DataPart('image/jpeg', Uint8List.fromList(bytes)))
        .toList();

    // 4- converts the input string message into a TextPart
    final prompt = TextPart(message);
    // ignore: unused_local_variable
    final content = [
      Content.multi(
        [prompt, ...imagesParts],
      )
    ];
    // send content
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

  sendMessageToHiveAndGetAllMessage(ChatModel chatModel) {
    HiveServices.addChatModelToChatBox(
      chatModel,
      currentChatHistoryId!.chatHistoryId,
    );
    getChatModelsFromHive();
  }

  getChatModelsFromHive() {
    currentChat = HiveServices.getChatsWithIdBox(
        boxName: currentChatHistoryId!.chatHistoryId);
    emit(GetChatModelsFromHiveSuccess());
  }

  //get chat history ids
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
    currentChat =
        HiveServices.getChatsWithIdBox(boxName: chatHistoryId.chatHistoryId);
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

  //change image from XFile to url
  List<String> getImagesUrls({required bool isTextOnly}) {
    List<String> imagesUrls = [];
    if (!isTextOnly) {
      for (var image in imagesList) {
        imagesUrls.add(image.path);
      }
    }
    return imagesUrls;
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
