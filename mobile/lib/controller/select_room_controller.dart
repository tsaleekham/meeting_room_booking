import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/room.dart';

class SelectRoomController with ChangeNotifier {
  final dio = Dio();

  List<Room>? _roomList = [];
  List<Room>? get roomList => _roomList;

  DateTime? _pickedDate = DateTime.now();
  DateTime? get pickedDate => _pickedDate;

  TimeOfDay? _startTime;
  TimeOfDay? get startTime => _startTime;

  DateTime? _dStartTime;
  DateTime? get dStartTime => _dStartTime;

  TimeOfDay? _endTime;
  TimeOfDay? get endTime => _endTime;

  DateTime? _dEndTime;
  DateTime? get dEndTime => _dEndTime;

  void setPickedDate(DateTime date) {
    _pickedDate = date;
    notifyListeners();
  }

  void setRoomList(List<Room> newRoomList) {
    _roomList = newRoomList;
    notifyListeners();
  }

  void setStartTime(TimeOfDay newStartTime) {
    _startTime = newStartTime;
    int year = pickedDate?.year ?? 0;
    int month = pickedDate?.month ?? 0;
    int day = pickedDate?.day ?? 0;
    int hour = newStartTime.hour;
    int minute = newStartTime.minute;
    _dStartTime = DateTime(year, month, day, hour, minute);

    notifyListeners();
  }

  void setEndTime(TimeOfDay newEndTime) {
    _endTime = newEndTime;
    int year = pickedDate?.year ?? 0;
    int month = pickedDate?.month ?? 0;
    int day = pickedDate?.day ?? 0;
    int hour = newEndTime.hour;
    int minute = newEndTime.minute;
    _dEndTime = DateTime(year, month, day, hour, minute);

    notifyListeners();
  }

  Future<void> getRooms() async {
    try {
      // Response<List<dynamic>> response =
      //     await dio.get("http://localhost:8080/rooms");
      // if (response.statusCode == 200) {
      //   var rooms = response.data ?? [];
      //   List<Room> roomListTemp = [];
      //   for (var room in rooms) {
      //     roomListTemp.add(
      //       Room.fromJson(room),
      //     );
      //   }
      //   setRoomList(roomListTemp);
      // }
      setRoomList([
        Room(id: 0, name: "small room", capacity: 7),
        Room(id: 1, name: "big room", capacity: 20),
        Room(id: 2, name: "windows room", capacity: 10),
      ]);
    } catch (e) {
      print("in catch error!");
      print(e);
    }
  }
}
