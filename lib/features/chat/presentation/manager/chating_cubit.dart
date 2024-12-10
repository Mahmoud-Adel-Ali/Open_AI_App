import 'package:flutter_bloc/flutter_bloc.dart';

import 'chating_state.dart';

class ChatingCubit extends Cubit<ChatingState> {
  ChatingCubit() : super(ChatingInitial());
}
