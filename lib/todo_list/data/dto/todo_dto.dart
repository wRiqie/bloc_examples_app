import 'dart:convert';

import '../../domain/entities/todo_entity.dart';

class TodoDto extends TodoEntity {
  int? idDto;
  String titleDto;
  String bodyDto;

  TodoDto({
    this.idDto,
    required this.titleDto,
    required this.bodyDto,
  }) : super(
          id: idDto,
          title: titleDto,
          body: bodyDto,
        );

  TodoDto copyWith({
    int? idDto,
    String? titleDto,
    String? bodyDto,
    DateTime? createdAtDto,
  }) {
    return TodoDto(
      idDto: idDto ?? this.idDto,
      titleDto: titleDto ?? this.titleDto,
      bodyDto: bodyDto ?? this.bodyDto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': idDto,
      'title': titleDto,
      'body': bodyDto,
    };
  }

  factory TodoDto.fromMap(Map<String, dynamic> map) {
    return TodoDto(
      idDto: map['id'],
      titleDto: map['title'],
      bodyDto: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoDto.fromJson(String source) =>
      TodoDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoDto(idDto: $idDto, titleDto: $titleDto, bodyDto: $bodyDto)';
  }

  @override
  bool operator ==(covariant TodoDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.idDto == idDto &&
      other.titleDto == titleDto &&
      other.bodyDto == bodyDto;
  }

  @override
  int get hashCode {
    return idDto.hashCode ^
      titleDto.hashCode ^
      bodyDto.hashCode;
  }
}
