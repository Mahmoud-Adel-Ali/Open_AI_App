abstract class ChatingState {}

final class ChatingInitial extends ChatingState {}

final class PickImagesSuccess extends ChatingState {}

final class AddNewChatModel extends ChatingState {}

final class GetChatModelsFromHiveSuccess extends ChatingState {}

final class GetChatHistoryIdsSuccess extends ChatingState {}

final class OpenNewChatRoomSuccess extends ChatingState {}

final class OpenChatRoomSuccess extends ChatingState {}

final class SendMessageToAiLoading extends ChatingState {}

final class SendMessageToAiSuccess extends ChatingState {}

final class SendMessageToAiFailure extends ChatingState {
  final String error;

  SendMessageToAiFailure({required this.error});
}
