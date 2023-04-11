// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatModel {
  String room_id;
  String message;
  String name;
  String sent_by;
  ChatModel({
    required this.room_id,
    required this.message,
    required this.name,
    required this.sent_by,
  });

  ChatModel copyWith({
    String? room_id,
    String? message,
    String? name,
    String? sent_by,
  }) {
    return ChatModel(
      room_id: room_id ?? this.room_id,
      message: message ?? this.message,
      name: name ?? this.name,
      sent_by: sent_by ?? this.sent_by,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'room_id': room_id,
      'message': message,
      'name': name,
      'sent_by': sent_by,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      room_id: map['room_id'] as String,
      message: map['message'] as String,
      name: map['name'] as String,
      sent_by: map['sent_by'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatModel(room_id: $room_id, message: $message, name: $name, sent_by: $sent_by)';
  }

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.room_id == room_id &&
      other.message == message &&
      other.name == name &&
      other.sent_by == sent_by;
  }

  @override
  int get hashCode {
    return room_id.hashCode ^
      message.hashCode ^
      name.hashCode ^
      sent_by.hashCode;
  }
}
