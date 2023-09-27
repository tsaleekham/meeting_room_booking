import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_room_booking/common/booking_card/cancelled_room_card.dart';
import 'package:meeting_room_booking/common/booking_card/completed_room_card.dart';
import 'package:meeting_room_booking/common/booking_card/reserved_room_card.dart';
import 'package:meeting_room_booking/common/bottom_layout.dart';
import 'package:meeting_room_booking/common/p_button.dart';
import 'package:meeting_room_booking/common/my_app_bar.dart';
import 'package:meeting_room_booking/controller/application_cubit.dart';
import 'package:meeting_room_booking/model/booking.dart';

class MyBookingHistoryPage extends StatelessWidget {
  const MyBookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        MyAppBar(
          backgroundImage: Image.asset("assets/top_bar_background.png").image,
          title: "My Booking History",
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Reserved",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocSelector<ApplicationCubit, ApplicationState,
                      List<Booking>>(
                    selector: (state) => state.reserved,
                    builder: (context, reserved) {
                      return Column(
                        children: reserved.isNotEmpty
                            ? reserved
                                .map(
                                  (el) => ReservedRoomCard(
                                    booking: el,
                                  ),
                                )
                                .toList()
                            : [
                                const SizedBox(
                                  height: 80,
                                  child: Center(
                                    child: Text(
                                      "No Reserved Booking",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                      );
                    },
                  ),

                  // ...(state.reserved.isNotEmpty
                  //     ? state.reserved.map(
                  //         (el) => ReservedRoomCard(
                  //           booking: el,
                  //         ),
                  //       )
                  //     : [
                  //         const SizedBox(
                  //           height: 80,
                  //           child: Center(
                  //             child: Text(
                  //               "No Reserved Booking",
                  //               style: TextStyle(
                  //                 fontSize: 20,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ]),
                  Row(
                    children: const [
                      Text(
                        "Cancelled",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocSelector<ApplicationCubit, ApplicationState,
                      List<Booking>>(
                    selector: (state) => state.cancelled,
                    builder: (context, cancelled) {
                      return Column(
                        children: cancelled.isNotEmpty
                            ? cancelled
                                .map(
                                  (el) => CancelledRoomCard(
                                    booking: el,
                                  ),
                                )
                                .toList()
                            : [
                                const SizedBox(
                                  height: 80,
                                  child: Center(
                                    child: Text(
                                      "No Cancelled Booking",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                      );
                    },
                  ),

                  Row(
                    children: const [
                      Text(
                        "Completed",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  BlocSelector<ApplicationCubit, ApplicationState,
                      List<Booking>>(
                    selector: (state) => state.completed,
                    builder: (context, completed) {
                      return Column(
                        children: completed.isNotEmpty
                            ? (completed.map(
                                (el) => CompletedRoomCard(
                                  booking: el,
                                ),
                              )).toList()
                            : [
                                const SizedBox(
                                  height: 80,
                                  child: Center(
                                    child: Text(
                                      "No Completed Booking",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: BottomLayout(
            child: SizedBox(
              height: 75,
              child: PButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const SelectRoomPage();
                  //     },
                  //   ),
                  // );
                  context.push("/select_room");
                },
                child: const Text(
                  "Make New Booking",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
