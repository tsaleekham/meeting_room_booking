import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/model/booking.dart';
// import 'package:meeting_room_booking/model/room.dart';

// Room mockRoom = Room(
//   id: 0,
//   capacity: 20,
//   name: 'mock room name',
//   createdAt: DateTime(2023, 1, 1),
//   updatedAt: DateTime(2023, 1, 1),
// );
// Booking mockBooking = Booking(
//   id: 0,
//   number: 'mock booking number',
//   room: mockRoom,
//   startTime: DateTime(2023, 1, 1),
//   endTime: DateTime(2023, 1, 1),
//   status: BookingStatus.reserved,
// );

class ApplicationState extends Equatable {
  final List<Booking> reserved;
  final List<Booking> cancelled;
  final List<Booking> completed;

  // initial states
  const ApplicationState({
    required this.reserved,
    required this.cancelled,
    required this.completed,
  });

  ApplicationState copyWith({
    List<Booking>? reserved,
    List<Booking>? cancelled,
    List<Booking>? completed,
  }) {
    return ApplicationState(
      reserved: reserved ?? this.reserved,
      cancelled: cancelled ?? this.cancelled,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [
        reserved,
        cancelled,
        completed,
      ];
}

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit()
      : super(
          const ApplicationState(
            reserved: [],
            cancelled: [],
            completed: [],
          ),
        );

  void addReserved(Booking newReserved) {
    emit(state.copyWith(reserved: [...state.reserved, newReserved]));
  }

  void cancelBooking(String bookingNumber) {
    Booking? bookingToCancel =
        state.reserved.firstWhere((element) => element.number == bookingNumber);

    List<Booking> updatingReserved = List.from(state.reserved);
    List<Booking> updatingCancelled = List.from(state.cancelled);
    updatingReserved.remove(bookingToCancel);
    updatingCancelled.add(bookingToCancel);

    emit(
      state.copyWith(
        reserved: updatingReserved,
        cancelled: updatingCancelled,
      ),
    );
  }
}
