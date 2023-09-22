import 'package:json_annotation/json_annotation.dart';
import 'package:meeting_room_booking/model/room.dart';

enum BookingStatus { reserved, cancelled, completed }

@JsonSerializable()
class Booking {
  final int id;
  final String number;
  // final int userId;
  final Room room;
  final DateTime startTime;
  final DateTime endTime;
  final BookingStatus status;

  Booking({
    required this.id,
    required this.number,
    // required this.userId,
    required this.room,
    required this.startTime,
    required this.endTime,
    required this.status,
  });
}
