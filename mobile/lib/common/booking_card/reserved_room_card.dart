import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/common/p_button.dart';
import 'package:meeting_room_booking/common/p_outlined_button.dart';
import 'package:meeting_room_booking/controller/application_cubit.dart';
import 'package:meeting_room_booking/model/booking.dart';

class ReservedRoomCard extends StatelessWidget {
  final Booking booking;
  const ReservedRoomCard({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    void handleCancelBooking() {
      context.read<ApplicationCubit>().cancelBooking(booking.number);
      context.pop();
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 24,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      // width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booking No. ${booking.number}",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking.room.name,
                ),
                Text("${booking.room.capacity} Guests max")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat("dd/MM/y").format(booking.startTime),
                ),
                Text(
                  "${DateFormat.jm().format(booking.startTime)} - ${DateFormat.jm().format(booking.endTime)}",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: PButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              title: const Text("Cancel Booking"),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Booking No. ${booking.number}"),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      "If you cancel this booking, you will lose your reservation.",
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      "Are you sure you want to cancel your booking?",
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 75,
                                      child: POutlinedButton(
                                        borderColor:
                                            Theme.of(context).colorScheme.error,
                                        onPressed: () {
                                          // Navigator.of(context).pop();
                                          context.pop();
                                        },
                                        child: Text(
                                          "No, Keep My booking",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 75,
                                      child: PButton(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                          Theme.of(context).colorScheme.error,
                                        ),
                                        onPressed: handleCancelBooking,
                                        child: const Text(
                                          "Yes, Cancel booking",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.error,
                      ),
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
