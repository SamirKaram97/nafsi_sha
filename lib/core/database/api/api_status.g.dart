// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class APIStatusAdapter extends TypeAdapter<APIStatus> {
  @override
  final int typeId = 1;

  @override
  APIStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return APIStatus.none;
      case 1:
        return APIStatus.loading;
      case 2:
        return APIStatus.success;
      case 3:
        return APIStatus.error;
      default:
        return APIStatus.none;
    }
  }

  @override
  void write(BinaryWriter writer, APIStatus obj) {
    switch (obj) {
      case APIStatus.none:
        writer.writeByte(0);
        break;
      case APIStatus.loading:
        writer.writeByte(1);
        break;
      case APIStatus.success:
        writer.writeByte(2);
        break;
      case APIStatus.error:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APIStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
