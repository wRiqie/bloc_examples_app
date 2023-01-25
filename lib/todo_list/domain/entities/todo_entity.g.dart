// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoEntityAdapter extends TypeAdapter<TodoEntity> {
  @override
  final int typeId = 1;

  @override
  TodoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoEntity(
      id: fields[0] as int?,
      title: fields[1] as String,
      body: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TodoEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
