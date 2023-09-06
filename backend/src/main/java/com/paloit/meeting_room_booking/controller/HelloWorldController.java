package com.paloit.meeting_room_booking.controller;

import com.paloit.meeting_room_booking.response.GetHelloWorldResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {
    @GetMapping("/hello")
    public GetHelloWorldResponse getHelloWorld() {
        GetHelloWorldResponse response = new GetHelloWorldResponse();
        response.setText("hello world");
        return response;
    }
}
