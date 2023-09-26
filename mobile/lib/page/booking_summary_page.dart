import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/common/bottom_layout.dart';
import 'package:meeting_room_booking/common/p_button.dart';
import 'package:meeting_room_booking/common/p_outlined_button.dart';
import 'package:meeting_room_booking/controller/application_cubit.dart';
import 'package:meeting_room_booking/controller/select_room_cubit.dart';
import 'package:meeting_room_booking/model/booking.dart';
import 'package:meeting_room_booking/model/room.dart';
import 'package:meeting_room_booking/page/booking_success_page.dart';

class BookingSummaryPage extends StatelessWidget {
  const BookingSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectRoomCubit, SelectRoomState>(
      builder: (context, state) {
        Room? currentRoom = state.selectedRoom;
        String roomNumber = currentRoom?.name ?? "";
        String capacity = "${currentRoom?.capacity} Guests max";

        void handleConfirmBooking() {
          DateTime dStartTime = state.dStartTime ?? DateTime.now();
          DateTime dEndTime = state.dStartTime ?? DateTime.now();
          if (currentRoom != null) {
            Booking? booked = context.read<SelectRoomCubit>().confirmBooking(
                  currentRoom,
                  dStartTime,
                  dEndTime,
                );

            if (booked != null) {
              context.read<ApplicationCubit>().addReserved(booked);
            }

            context.read<SelectRoomCubit>().clearSelectRoomPageFields();

            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const BookingSuccessPage();
              },
            ));
          }
        }

        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/meeting_room_dark.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 62),
                    child: Text(
                      "Booking\nSummary",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  BottomLayout(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: POutlinedButton(
                          onPressed: () {},
                          child: Text(
                            DateFormat('dd/MM/y').format(
                              state.pickedDate ?? DateTime.now(),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Start time",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: POutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      state.startTime?.format(context) ?? "-",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "End time",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: POutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      state.endTime?.format(context) ?? "-",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Selected Room",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 75,
                        child: POutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  roomNumber,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                capacity,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 75,
                        child: POutlinedButton(
                          borderColor: Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 75,
                        child: PButton(
                          onPressed: handleConfirmBooking,
                          child: const Text(
                            "Confirm Booking",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
