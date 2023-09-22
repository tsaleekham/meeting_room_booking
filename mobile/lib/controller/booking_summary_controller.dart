import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/room.dart';

class BookingSummaryController with ChangeNotifier {
  Room? _room;
  Room? get room => _room;

  void setRoom(Room newRoom) {
    _room = newRoom;
    notifyListeners();
  }
}
