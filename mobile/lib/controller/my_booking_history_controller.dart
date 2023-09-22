import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/room.dart';
import '../model/booking.dart';

List<Booking> mockReserved = [
  Booking(
    id: 0,
    number: "AA001",
    room: Room(
      id: 1,
      name: "Biggest room",
      capacity: 20,
    ),
    startTime: DateTime(2023, 10, 1, 9),
    endTime: DateTime(
      2023,
      10,
      1,
      13,
    ),
    status: BookingStatus.reserved,
  ),
  Booking(
    id: 0,
    number: "AA001",
    room: Room(
      id: 1,
      name: "Biggest room",
      capacity: 20,
    ),
    startTime: DateTime(2023, 10, 1, 14),
    endTime: DateTime(2023, 10, 1, 18, 30),
    status: BookingStatus.reserved,
  )
];
List<Booking> mockCancelled = [
  Booking(
    id: 0,
    number: "AA001",
    room: Room(
      id: 1,
      name: "Biggest room",
      capacity: 20,
    ),
    startTime: DateTime(2023, 10, 1, 9),
    endTime: DateTime(
      2023,
      10,
      1,
      13,
    ),
    status: BookingStatus.cancelled,
  ),
  Booking(
    id: 0,
    number: "AA001",
    room: Room(
      id: 1,
      name: "Biggest room",
      capacity: 20,
    ),
    startTime: DateTime(2023, 10, 1, 14),
    endTime: DateTime(2023, 10, 1, 18, 30),
    status: BookingStatus.cancelled,
  )
];
List<Booking> mockCompleted = [];

class MyBookingHistoryController with ChangeNotifier {
  List<Booking>? _reserved;
  List<Booking>? get reserved => _reserved;

  List<Booking>? _cancelled;
  List<Booking>? get cancelled => _cancelled;

  List<Booking>? _completed;
  List<Booking>? get completed => _completed;

  void setReserved(List<Booking> newReserved) {
    _reserved = newReserved;
    notifyListeners();
  }

  void setCancelled(List<Booking> newCancelled) {
    _cancelled = newCancelled;
    notifyListeners();
  }

  void setCompleted(List<Booking> newCompleted) {
    _completed = newCompleted;
    notifyListeners();
  }

  void confirmBooking(Room room, DateTime startTime, DateTime endtime) {}
}
