package com.paloit.meeting_room_booking.service;

import com.paloit.meeting_room_booking.dbmodel.Room;
import com.paloit.meeting_room_booking.repository.RoomRepository;
import com.paloit.meeting_room_booking.request.CreateRoomRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoomService {
    private final RoomRepository roomRepository;

    public RoomService(RoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    public List<Room> getRooms() {
        return roomRepository.findAll();
    }

    public Room createRoom(CreateRoomRequest request) {
        Room newRoom = new Room();
        newRoom.setName(request.getName());
        newRoom.setCapacity(request.getCapacity());

        roomRepository.save(newRoom);

        return newRoom;
    }

    public Optional<Room> getRoomById(Long id) {
        return roomRepository.findById(id);
    }

    public void deleteRoom(Long id) {
       roomRepository.deleteById(id);
    }

    public Optional<Room> updateRoom(Long id, CreateRoomRequest request) {
        Optional<Room> room = getRoomById(id);
        if (room.isEmpty()) return Optional.empty();

        room.get().setName(request.getName());
        room.get().setCapacity(request.getCapacity());
        roomRepository.save(room.get());

        return room;
    }
}
