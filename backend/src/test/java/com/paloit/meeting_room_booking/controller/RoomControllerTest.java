package com.paloit.meeting_room_booking.controller;

import io.restassured.RestAssured;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class RoomControllerTest {
    @LocalServerPort
    private int port;
    @BeforeEach
    public void setup() {
        RestAssured.port = port;

        Map<String, Object> room = new HashMap<>();
        room.put("name", "abcdef123");
        room.put("capacity", 20);

        given().log().all().header("Content-Type", "application/json")
                .body(room).when().post("/rooms/create").then().statusCode(201);
    }

    @Test
    public void get_all_rooms_success_200() {
        given().log().all().with().when()
                .get("/rooms").then().statusCode(200)
                .assertThat().body("isEmpty()", Matchers.is(false));
    }

    @Test
    public void get_room_by_id_not_found_404() {
        given().log().all().when().get("/rooms/9999").then()
                .statusCode(404);
    }

    @Test
    public void create_room_success_201() {
        Map<String, Object> room = new HashMap<>();
        room.put("name", "abcdef123");
        room.put("capacity", 20);

        given().log().all().header("Content-Type", "application/json")
                .body(room).when().post("/rooms/create").then().statusCode(201);
    }

    @Test
    public void create_room_bad_request_400() {
        given().log().all().header("Content-Type", "application/json")
                .when().post("/rooms/create").then().statusCode(400);
    }

    @Test
    public void get_room_by_id_success() {
        given().log().all().when().get("/rooms/999").then().statusCode(200);
    }

    @Test
    public void delete_room_success_200() {
        given().log().all().when().delete("/rooms/999").then().statusCode(HttpStatus.OK.value());
    }

//    @AfterEach
//    public void reset() {
//
//    }
}
