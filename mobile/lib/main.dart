import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/controller/application_cubit.dart';
import 'package:meeting_room_booking/controller/select_room_cubit.dart';
import 'package:meeting_room_booking/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ApplicationCubit(),
          ),
          BlocProvider(
            create: (context) => SelectRoomCubit(),
          ),
        ],
        child: MaterialApp.router(
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
          routerConfig: router,
        ));
  }
}
