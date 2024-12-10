import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'chating_state.dart';

class ChatingCubit extends Cubit<ChatingState> {
  ChatingCubit() : super(ChatingInitial());
  TextEditingController chatTextFeild = TextEditingController();
  List<XFile>? imagesList = [];
}
