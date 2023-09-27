import 'package:go_router/go_router.dart';
import 'package:meeting_room_booking/page/booking_success_page.dart';
import 'package:meeting_room_booking/page/booking_summary_page.dart';
import 'package:meeting_room_booking/page/meeting_room_landing_page.dart';
import 'package:meeting_room_booking/page/my_booking_history_page.dart';
import 'package:meeting_room_booking/page/select_room_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MeetingRoomLandingPage(),
    ),
    GoRoute(
      path: '/booking_history',
      builder: (context, state) => const MyBookingHistoryPage(),
    ),
    GoRoute(
      path: '/select_room',
      builder: (context, state) => const SelectRoomPage(),
    ),
    GoRoute(
      path: '/booking_summary',
      builder: (context, state) => const BookingSummaryPage(),
    ),
    GoRoute(
      path: '/booking_success',
      builder: (context, state) => const BookingSuccessPage(),
    )
  ],
);
