// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history_id_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatHistoryIdModelAdapter extends TypeAdapter<ChatHistoryIdModel> {
  @override
  final int typeId = 0;

  @override
  ChatHistoryIdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatHistoryIdModel(
      chatHistoryId: fields[0] as String,
      dateTime: fields[1] as DateTime,
      chatName: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChatHistoryIdModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.chatHistoryId)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.chatName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatHistoryIdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
