import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/model/booking.dart';

class CompletedRoomCard extends StatelessWidget {
  final Booking booking;
  const CompletedRoomCard({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 24,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
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
          ],
        ),
      ),
    );
  }
}
