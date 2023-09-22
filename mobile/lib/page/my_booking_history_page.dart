import 'package:flutter/material.dart';
import 'package:meeting_room_booking/common/booking_card/cancelled_room_card.dart';
import 'package:meeting_room_booking/common/booking_card/completed_room_card.dart';
import 'package:meeting_room_booking/common/booking_card/reserved_room_card.dart';
import 'package:meeting_room_booking/common/bottom_layout.dart';
import 'package:meeting_room_booking/common/p_button.dart';
import 'package:meeting_room_booking/common/my_app_bar.dart';
import 'package:meeting_room_booking/controller/my_booking_history_controller.dart';
import 'package:meeting_room_booking/model/booking.dart';
import 'package:meeting_room_booking/page/select_room_page.dart';
import 'package:provider/provider.dart';

class MyBookingHistoryPage extends StatelessWidget {
  const MyBookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Booking> reserved =
        context.watch<MyBookingHistoryController>().reserved ?? [];
    List<Booking> cancelled =
        context.watch<MyBookingHistoryController>().cancelled ?? [];
    List<Booking> completed =
        context.watch<MyBookingHistoryController>().completed ?? [];

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
                  ...(reserved.isNotEmpty
                      ? reserved.map(
                          (el) => ReservedRoomCard(
                            booking: el,
                          ),
                        )
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
                          )
                        ]),
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
                  ...(cancelled.isNotEmpty
                      ? cancelled.map(
                          (el) => CancelledRoomCard(
                            booking: el,
                          ),
                        )
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
                        ]),
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
                  ...(completed.isNotEmpty
                      ? (completed.map(
                          (el) => CompletedRoomCard(
                            booking: el,
                          ),
                        ))
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
                        ]),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SelectRoomPage();
                      },
                    ),
                  );
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
