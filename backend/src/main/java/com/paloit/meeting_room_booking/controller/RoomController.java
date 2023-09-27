package com.paloit.meeting_room_booking.controller;

import com.paloit.meeting_room_booking.dbmodel.Room;
import com.paloit.meeting_room_booking.request.CreateRoomRequest;
import com.paloit.meeting_room_booking.service.RoomService;
import jakarta.websocket.server.PathParam;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class RoomController {
    private final RoomService roomService;

    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }
    @GetMapping("/rooms")
    public ResponseEntity<List<Room>> getAllRooms () {
        List<Room> getRoomsResult = roomService.getRooms();
        return ResponseEntity.status(HttpStatus.OK).body(getRoomsResult) ;
    }
//
    @GetMapping("/rooms/{id}")
    public ResponseEntity<Room> getRoom(@PathVariable("id") Long id) {
        // find room by route param id and return
        Optional<Room> room = roomService.getRoomById(id);
        if (room.isEmpty()) return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        return ResponseEntity.status(HttpStatus.OK).body(room.get());
    }

    @PostMapping("/rooms/create")
    public ResponseEntity<Room> createRoom(@RequestBody CreateRoomRequest request) {
        Room response = roomService.createRoom(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
    @PutMapping("/rooms/{id}")
    public ResponseEntity<Room> updateRoom(@RequestBody CreateRoomRequest request, @PathVariable("id") Long id) {
        Optional<Room> room = roomService.updateRoom(id, request);
        if (room.isEmpty()) return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        return ResponseEntity.status(HttpStatus.OK).body(room.get());
    }

    @DeleteMapping("/rooms/{id}")
    public ResponseEntity deleteRoom(@PathVariable("id") Long id) {
        Optional<Room> room = roomService.getRoomById(id);
        if (room.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        roomService.deleteRoom(id);
        return ResponseEntity.status(HttpStatus.OK).build();
    }
}
