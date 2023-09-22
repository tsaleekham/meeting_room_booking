import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Room {
  final int id;
  final String name;
  final int capacity;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Room({
    required this.id,
    required this.name,
    required this.capacity,
    this.createdAt,
    this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] as int,
      name: json['name'] as String,
      capacity: json['capacity'] as int,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
