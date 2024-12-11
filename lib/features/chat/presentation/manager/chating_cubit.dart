import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_ai_app/core/api/api_keys.dart';

import 'chating_state.dart';

class ChatingCubit extends Cubit<ChatingState> {
  ChatingCubit() : super(ChatingInitial());
  TextEditingController chatTextFeild = TextEditingController();
  List<XFile>? imagesList = [];

  // generative model for the text
  late GenerativeModel _textModel;
  Future<void> sendMessage() async {
    _textModel = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: ApiKeys.apiKey,
    );

    const prompt = 'Write a story about a magic backpack.';
    // final content = [Content.text(prompt)];
    final content = [Content.text(prompt)];
    final GenerateContentResponse response =
        await _textModel.generateContent(content);
    // GenerateContentResponse g = GenerateContentResponse();
    log("hashCode is '${response.hashCode}'");
    log("answer is '${response.text}'");
  }

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
