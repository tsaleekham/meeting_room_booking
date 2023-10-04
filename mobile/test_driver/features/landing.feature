Feature: Open the app
    Scenario: Successful landing page
        Given I am on the landing page
        Then I should see the "login_button"

        When I click the "login_button"
        Then I should see the "Make New Booking"
        And I expect the text "No Reserved Booking" to be present
        And I expect the text "No Cancelled Booking" to be present
        And I expect the text "No Completed Booking" to be present

        When I click the "make_new_booking_button"
        Then I should see the "search_meeting_room_button"

        When I click the "start_time_button"
        Then I expect the widget "start_time_dialog" to be present within 5 seconds

        When I tap the button that contains the text "OK"
        Then I wait until the "start_time_dialog" is absent

        When I click the "end_time_button"
        Then I expect the widget "end_time_dialog" to be present within 5 seconds

        When I tap the button that contains the text "OK"
        Then I wait until the "end_time_dialog" is absent

        When I tap the "search_meeting_room_button" button
        Then I tap the button that contains the text "big room"
        And I expect the widget "confirm_booking_button" to be present within 5 seconds
        And I expect the text "big room" to be present

        When I tap the "confirm_booking_button" button
        Then I expect the text "Successful" to be present
        And I expect the text "Your Booking No. is" to be present

        When I tap the "my_booking_history" button
        # Then I expect the "make_new_booking_button" button to be present within 5 seconds
        And I expect the text "No Reserved Booking" to be absent

        When I tap the button that contains the text "Cancel"
        Then I expect the text "Cancel Booking" to be present
        # And I expect the

        Then I pause for 5 seconds

# Then I expect the text "SELECT TIME" to be absent



# When I click the "end_time_button"
# When I click the "OK" text

# When I click the "search_meeting_room_button"
# Then I should see the "select_room_1"

# When I click the "select_room_1"
# Then I should see the "confirm_booking_button"

