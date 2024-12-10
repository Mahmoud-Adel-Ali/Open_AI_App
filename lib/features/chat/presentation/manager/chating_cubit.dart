import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'chating_state.dart';

class ChatingCubit extends Cubit<ChatingState> {
  ChatingCubit() : super(ChatingInitial());
  TextEditingController chatTextFeild = TextEditingController();
  List<XFile>? imagesList = [];

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
