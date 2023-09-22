import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/booking.dart';
import 'package:meeting_room_booking/model/room.dart';

class BookingSuccessController with ChangeNotifier {
  Booking? _booked;
  Booking? get booked => _booked;

  void setBookedRoom(Booking? newBooked) {
    _booked = newBooked;
    notifyListeners();
  }

  Booking? confirmBooking(Room room, DateTime startTime, DateTime endTime) {
    setBookedRoom(
      Booking(
        id: 0,
        number: "Mocked number",
        room: room,
        startTime: startTime,
        endTime: endTime,
        status: BookingStatus.reserved,
      ),
    );
    return booked;
  }
}
