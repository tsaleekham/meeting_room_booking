import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/common/bottom_layout.dart';
import 'package:meeting_room_booking/common/p_button.dart';
import 'package:meeting_room_booking/common/p_outlined_button.dart';
import 'package:meeting_room_booking/controller/application_cubit.dart';
import 'package:meeting_room_booking/controller/select_room_cubit.dart';
import 'package:meeting_room_booking/model/booking.dart';
import 'package:meeting_room_booking/model/room.dart';

class BookingSummaryPage extends StatelessWidget {
  const BookingSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    void handleConfirmBooking(
        Room? room, DateTime? newDStartTime, DateTime? newDEndTime) {
      DateTime dStartTime = newDStartTime ?? DateTime.now();
      DateTime dEndTime = newDEndTime ?? DateTime.now();
      if (room != null) {
        Booking? booked = context.read<SelectRoomCubit>().confirmBooking(
              room,
              dStartTime,
              dEndTime,
            );
        if (booked != null) {
          context.read<ApplicationCubit>().addReserved(booked);
        }
        context.read<SelectRoomCubit>().clearSelectRoomPageFields();
        context.replace("/booking_success");
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
                        child: BlocSelector<SelectRoomCubit, SelectRoomState,
                            DateTime?>(
                          selector: (state) => state.pickedDate,
                          builder: (context, pickedDate) {
                            return Text(
                              DateFormat('dd/MM/y').format(
                                pickedDate ?? DateTime.now(),
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            );
                          },
                        )),
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
                                  child: BlocSelector<SelectRoomCubit,
                                      SelectRoomState, TimeOfDay?>(
                                    selector: (state) => state.startTime,
                                    builder: (context, startTime) {
                                      return Text(
                                        startTime?.format(context) ?? "-",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      );
                                    },
                                  )),
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
                                  child: BlocSelector<SelectRoomCubit,
                                      SelectRoomState, TimeOfDay?>(
                                    selector: (state) => state.endTime,
                                    builder: (context, endTime) {
                                      return Text(
                                        endTime?.format(context) ?? "-",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      );
                                    },
                                  )),
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
                              child: BlocSelector<SelectRoomCubit,
                                  SelectRoomState, String?>(
                            selector: (state) => state.selectedRoom?.name,
                            builder: (context, selectedRoomName) {
                              return Text(
                                selectedRoomName ?? "",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          )),
                          BlocSelector<SelectRoomCubit, SelectRoomState, int?>(
                            selector: (state) => state.selectedRoom?.capacity,
                            builder: (context, capacity) {
                              return Text(
                                "$capacity Guests max",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              );
                            },
                          )
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
                        // Navigator.of(context).pop();
                        context.pop();
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
                      child: BlocBuilder<SelectRoomCubit, SelectRoomState>(
                        buildWhen: (previous, current) {
                          return previous.selectedRoom !=
                                  current.selectedRoom ||
                              previous.dStartTime != current.dStartTime ||
                              previous.dEndTime != current.dEndTime;
                        },
                        builder: (context, state) {
                          return PButton(
                            key: const Key("confirm_booking_button"),
                            onPressed: () => handleConfirmBooking(
                              state.selectedRoom,
                              state.dStartTime,
                              state.dEndTime,
                            ),
                            child: const Text(
                              "Confirm Booking",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                      )),
                ],
              )),
            ],
          )
        ],
      ),
    );
  }
}
