import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/common/p_button.dart';
import 'package:meeting_room_booking/common/p_outlined_button.dart';
import 'package:meeting_room_booking/common/my_app_bar.dart';
import 'package:meeting_room_booking/controller/select_room_cubit.dart';
import 'package:meeting_room_booking/model/room.dart';

class SelectRoomPage extends StatelessWidget {
  const SelectRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    void handleSearch() {
      context.read<SelectRoomCubit>().getRooms();
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
                    child: BlocSelector<SelectRoomCubit, SelectRoomState,
                        DateTime?>(
                      selector: (state) => state.pickedDate,
                      builder: (context, pickedDate) {
                        return PButton(
                          onPressed: () => showDatePicker(
                            context: context,
                            initialDate: pickedDate ?? DateTime.now(),
                            firstDate: DateTime(2023, 1, 1),
                            lastDate: DateTime(2023, 12, 31),
                          ).then(
                            (selectedDate) {
                              if (selectedDate != null) {
                                context
                                    .read<SelectRoomCubit>()
                                    .setPickedDate(selectedDate);
                              }
                            },
                          ),
                          child: Text(
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            DateFormat('dd/MM/y').format(
                              pickedDate ?? DateTime.now(),
                            ),
                          ),
                        );
                      },
                    )),
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
                                                  .read<SelectRoomCubit>()
                                                  .setStartTime(
                                                      selectedStartTime)
                                            }
                                        }),
                                child: BlocSelector<SelectRoomCubit,
                                    SelectRoomState, TimeOfDay?>(
                                  selector: (state) => state.startTime,
                                  builder: (context, startTime) {
                                    return Text(
                                      startTime?.format(context) ?? "-",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
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
                                                  .read<SelectRoomCubit>()
                                                  .setEndTime(selectedEndTime)
                                            }
                                        }),
                                child: BlocSelector<SelectRoomCubit,
                                    SelectRoomState, TimeOfDay?>(
                                  selector: (state) => state.endTime,
                                  builder: (context, endTime) {
                                    return Text(
                                      endTime?.format(context) ?? "-",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
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
                SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: BlocBuilder<SelectRoomCubit, SelectRoomState>(
                      buildWhen: (previous, current) {
                        return previous.pickedDate != current.pickedDate ||
                            previous.startTime != current.startTime ||
                            previous.endTime != current.endTime;
                      },
                      builder: (context, state) {
                        return PButton(
                          onPressed: handleSearch,
                          disabled: state.pickedDate == null ||
                              state.startTime == null ||
                              state.endTime == null,
                          child: const Text(
                            "Search",
                          ),
                        );
                      },
                    )),
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
              child:
                  BlocSelector<SelectRoomCubit, SelectRoomState, List<Room>?>(
            selector: (state) => state.roomList,
            builder: (context, roomList) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: roomList?.length ?? 0,
                itemBuilder: (context, index) {
                  Room? room = roomList?.elementAt(index);
                  String roomNumber = room?.name ?? "";
                  String capacity = "${room?.capacity} Guests max";
                  return SizedBox(
                    height: 75,
                    child: POutlinedButton(
                      onPressed: () {
                        if (room != null) {
                          context.read<SelectRoomCubit>().setSelectedRoom(room);

                          context.push("/booking_summary");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return const BookingSummaryPage();
                          //     },
                          //   ),
                          // );
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
              );
            },
          ))
        ],
      ),
    );
  }
}
