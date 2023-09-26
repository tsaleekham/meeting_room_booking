import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/common/bottom_layout.dart';
import 'package:meeting_room_booking/common/p_button.dart';
import 'package:meeting_room_booking/controller/select_room_cubit.dart';
import 'package:meeting_room_booking/model/booking.dart';
import 'package:meeting_room_booking/page/my_booking_history_page.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectRoomCubit, SelectRoomState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/meeting_room_dark.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Booking",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Successful",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "You Booking No. is",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocSelector<SelectRoomCubit, SelectRoomState,
                            Booking?>(
                          selector: (cubit) => cubit.successBooking,
                          builder: (context, successBooking) {
                            return Text(
                              successBooking?.number ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                BottomLayout(
                  child: SizedBox(
                    width: double.infinity,
                    child: PButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const MyBookingHistoryPage();
                            },
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 24,
                        ),
                        child: Text(
                          "My Booking History",
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
            )
          ]),
        );
      },
    );
  }
}
