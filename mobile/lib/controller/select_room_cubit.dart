import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/model/booking.dart';
import 'package:meeting_room_booking/model/room.dart';
import 'package:uuid/uuid.dart';

class SelectRoomState extends Equatable {
  final List<Room>? roomList;
  final DateTime? pickedDate;
  final TimeOfDay? startTime;
  final DateTime? dStartTime;
  final TimeOfDay? endTime;
  final DateTime? dEndTime;
  final Room? selectedRoom;
  final Booking? successBooking;

  const SelectRoomState({
    required this.pickedDate,
    required this.roomList,
    required this.startTime,
    required this.dStartTime,
    required this.endTime,
    required this.dEndTime,
    this.selectedRoom,
    this.successBooking,
  });

  SelectRoomState copyWith({
    DateTime? pickedDate,
    TimeOfDay? startTime,
    DateTime? dStartTime,
    TimeOfDay? endTime,
    DateTime? dEndTime,
    List<Room>? roomList,
    Room? selectedRoom,
    Booking? successBooking,
  }) {
    return SelectRoomState(
      pickedDate: pickedDate ?? this.pickedDate,
      roomList: roomList ?? this.roomList,
      startTime: startTime ?? this.startTime,
      dStartTime: dStartTime ?? this.dStartTime,
      endTime: endTime ?? this.endTime,
      dEndTime: dEndTime ?? this.dEndTime,
      selectedRoom: selectedRoom ?? this.selectedRoom,
      successBooking: successBooking ?? this.successBooking,
    );
  }

  SelectRoomState copyWithNullable({
    DateTime? pickedDate,
    TimeOfDay? startTime,
    DateTime? dStartTime,
    TimeOfDay? endTime,
    DateTime? dEndTime,
    List<Room>? roomList,
    Room? selectedRoom,
    Booking? successBooking,
  }) {
    return SelectRoomState(
      pickedDate: pickedDate,
      roomList: roomList,
      startTime: startTime,
      dStartTime: dStartTime,
      endTime: endTime,
      dEndTime: dEndTime,
      selectedRoom: selectedRoom,
      successBooking: successBooking,
    );
  }

  @override
  List<Object?> get props => [
        pickedDate,
        roomList,
        startTime,
        dStartTime,
        endTime,
        dEndTime,
        selectedRoom,
        successBooking,
      ];
}

class SelectRoomCubit extends Cubit<SelectRoomState> {
  SelectRoomCubit()
      : super(
          SelectRoomState(
            pickedDate: DateTime.now(),
            roomList: const [],
            startTime: null,
            endTime: null,
            dStartTime: null,
            dEndTime: null,
          ),
        );

  Future<void> getRooms() async {
    // Mock rooms
    if (state.pickedDate != null &&
        state.startTime != null &&
        state.endTime != null) {
      // setRoomList([
      //   Room(id: 0, name: "small room", capacity: 7),
      //   Room(id: 1, name: "big room", capacity: 20),
      //   Room(id: 2, name: "windows room", capacity: 10),
      // ]);
      emit(state.copyWith(roomList: [
        Room(id: 0, name: "small room", capacity: 7),
        Room(id: 1, name: "big room", capacity: 20),
        Room(id: 2, name: "windows room", capacity: 10),
      ]));
    }
    // try {
    //   Response<List<dynamic>> response =
    //       await dio.get("http://localhost:8080/rooms");
    //   if (response.statusCode == 200) {
    //     var rooms = response.data ?? [];
    //     List<Room> roomListTemp = [];
    //     for (var room in rooms) {
    //       roomListTemp.add(
    //         Room.fromJson(room),
    //       );
    //     }
    //     setRoomList(roomListTemp);
    //   }
    // } catch (e) {
    //   print("in catch error!");
    //   print(e);
    // }
  }

  void setPickedDate(DateTime date) {
    emit(state.copyWith(pickedDate: date));
  }

  void setStartTime(TimeOfDay newStartTime) {
    int year = state.pickedDate?.year ?? 0;
    int month = state.pickedDate?.month ?? 0;
    int day = state.pickedDate?.day ?? 0;
    int hour = newStartTime.hour;
    int minute = newStartTime.minute;
    DateTime localDStartTime = DateTime(year, month, day, hour, minute);

    emit(state.copyWith(startTime: newStartTime, dStartTime: localDStartTime));
  }

  void setEndTime(TimeOfDay newEndTime) {
    int year = state.pickedDate?.year ?? 0;
    int month = state.pickedDate?.month ?? 0;
    int day = state.pickedDate?.day ?? 0;
    int hour = newEndTime.hour;
    int minute = newEndTime.minute;
    DateTime localDEndTime = DateTime(year, month, day, hour, minute);

    emit(state.copyWith(endTime: newEndTime, dEndTime: localDEndTime));
  }

  void setSelectedRoom(Room newRoom) {
    emit(state.copyWith(selectedRoom: newRoom));
  }

  Booking? confirmBooking(Room room, DateTime startTime, DateTime endTime) {
    emit(
      state.copyWith(
        successBooking: Booking(
          id: 0,
          number: const Uuid().v4(),
          room: room,
          startTime: startTime,
          endTime: endTime,
          status: BookingStatus.reserved,
        ),
      ),
    );
    return state.successBooking;
  }

  void clearSelectRoomPageFields() {
    emit(
      state.copyWithNullable(
        pickedDate: DateTime.now(),
        startTime: null,
        endTime: null,
        roomList: [],
        dEndTime: null,
        dStartTime: null,
        selectedRoom: state.selectedRoom,
        successBooking: state.successBooking,
      ),
    );
  }
}
