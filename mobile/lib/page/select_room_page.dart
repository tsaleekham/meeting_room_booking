import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/common/p_button.dart';
import 'package:meeting_room_booking/common/p_outlined_button.dart';
import 'package:meeting_room_booking/common/my_app_bar.dart';
import 'package:meeting_room_booking/controller/booking_summary_controller.dart';
import 'package:meeting_room_booking/controller/select_room_controller.dart';
import 'package:meeting_room_booking/model/room.dart';
import 'package:meeting_room_booking/page/booking_summary_page.dart';
import 'package:provider/provider.dart';

class SelectRoomPage extends StatefulWidget {
  const SelectRoomPage({super.key});

  @override
  State<SelectRoomPage> createState() => _SelectRoomPageState();
}

class _SelectRoomPageState extends State<SelectRoomPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void handleSearch() {
      context.read<SelectRoomController>().getRooms();
    }

    bool shouldDisableSearchButton() {
      SelectRoomController controller = context.watch<SelectRoomController>();
      return controller.pickedDate == null ||
          controller.startTime == null ||
          controller.endTime == null;
    }

    return Scaffold(
      // backgroundColor: Colors.green,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppBar(
            backgroundImage: Image.asset("assets/blue_chair.png").image,
            title: "Select Meeting Room",
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Date",
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: PButton(
                    onPressed: () => showDatePicker(
                      context: context,
                      initialDate:
                          context.read<SelectRoomController>().pickedDate ??
                              DateTime.now(),
                      firstDate: DateTime(2023, 1, 1),
                      lastDate: DateTime(2023, 12, 31),
                    ).then(
                      (selectedDate) {
                        if (selectedDate != null) {
                          context
                              .read<SelectRoomController>()
                              .setPickedDate(selectedDate);
                        }
                      },
                    ),
                    child: Text(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      DateFormat('dd/MM/y').format(
                        context.watch<SelectRoomController>().pickedDate ??
                            DateTime.now(),
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
                        children: [
                          const Text(
                            "Start time",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: PButton(
                              onPressed: () => showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((selectedStartTime) => {
                                    if (selectedStartTime != null)
                                      {
                                        context
                                            .read<SelectRoomController>()
                                            .setStartTime(selectedStartTime)
                                      }
                                  }),
                              child: Text(
                                context
                                        .watch<SelectRoomController>()
                                        .startTime
                                        ?.format(context) ??
                                    "-",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
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
                        children: [
                          const Text(
                            "End time",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: PButton(
                              onPressed: () => showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((selectedEndTime) => {
                                    if (selectedEndTime != null)
                                      {
                                        context
                                            .read<SelectRoomController>()
                                            .setEndTime(selectedEndTime)
                                      }
                                  }),
                              child: Text(
                                context
                                        .watch<SelectRoomController>()
                                        .endTime
                                        ?.format(context) ??
                                    "-",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
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
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: PButton(
                    onPressed: handleSearch,
                    disabled: shouldDisableSearchButton(),
                    child: const Text(
                      "Search",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Avilable room",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount:
                  context.read<SelectRoomController>().roomList?.length ?? 0,
              itemBuilder: (context, index) {
                Room? room = context
                    .watch<SelectRoomController>()
                    .roomList
                    ?.elementAt(index);
                String roomNumber = room?.name ?? "";
                String capacity = "${room?.capacity} Guests max";
                return SizedBox(
                  height: 75,
                  child: POutlinedButton(
                    onPressed: () {
                      if (room != null) {
                        context.read<BookingSummaryController>().setRoom(room);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const BookingSummaryPage();
                            },
                          ),
                        );
                      }
                    },
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
                );
              },
              padding: const EdgeInsets.all(20),
            ),
          )
        ],
      ),
    );
  }
}
