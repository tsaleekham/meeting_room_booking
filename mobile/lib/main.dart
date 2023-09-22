import 'package:flutter/material.dart';
import 'package:meeting_room_booking/controller/booking_success_controller.dart';
import 'package:meeting_room_booking/controller/booking_summary_controller.dart';
import 'package:meeting_room_booking/controller/my_booking_history_controller.dart';
import 'package:meeting_room_booking/controller/select_room_controller.dart';
import 'package:meeting_room_booking/page/meeting_room_landing_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SelectRoomController(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookingSummaryController(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookingSuccessController(),
        ),
        ChangeNotifierProvider(
          create: (_) => MyBookingHistoryController(),
        )
      ],
      child: MaterialApp(
        title: 'Palo IT Meeting Room Booking App',
        theme: ThemeData(
          // primarySwatch: Colors.green,
          // primaryColor: const Color(0xFF5CC99B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFF5CC99B),
            error: Color(
              0xFFEA5C65,
            ),
          ),
        ),
        home: const MeetingRoomLandingPage(),
      ),
    );
  }
}
