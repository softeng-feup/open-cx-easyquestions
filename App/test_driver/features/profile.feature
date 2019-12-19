Feature: Select Talk to make a question

   Background: User logs into the app
    Given User inserts an email
    And User inserts a password
    When User hits LOGIN button
    Then User is logged in

  Scenario: Logged in user updates profile
    Given User has logged into the app
    When  User hits Profile Button
    And User hits Update Button
    Then User's Profile is updated