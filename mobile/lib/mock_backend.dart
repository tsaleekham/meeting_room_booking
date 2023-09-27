import 'model/room.dart';

class MockBackend {
  Future<List<Room>> getAvailableRooms(
      DateTime startTime, DateTime endTime) async {
    return [
      Room(
        id: 0,
        name: "Biggest room",
        capacity: 20,
      ),
      Room(
        id: 0,
        name: "Small room",
        capacity: 7,
      ),
      Room(
        id: 0,
        name: "Windows room",
        capacity: 10,
      ),
    ];
  }
}
