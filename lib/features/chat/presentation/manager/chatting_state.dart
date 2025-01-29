abstract class ChattingState {}

final class ChattingInitial extends ChattingState {}

final class PickImagesSuccess extends ChattingState {}

final class AddNewChatModel extends ChattingState {}

final class GetChatModelsFromHiveSuccess extends ChattingState {}

final class GetChatHistoryIdsSuccess extends ChattingState {}

final class OpenNewChatRoomSuccess extends ChattingState {}

final class OpenChatRoomSuccess extends ChattingState {}

final class SendMessageToAiLoading extends ChattingState {}

final class SendMessageToAiSuccess extends ChattingState {}

final class SendMessageToAiFailure extends ChattingState {
  final String error;

  SendMessageToAiFailure({required this.error});
}
