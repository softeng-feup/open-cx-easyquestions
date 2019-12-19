Feature: Select Talk to make a question

   Background: User logs into the app
    Given User inserts an email
    And User inserts a password
    When User hits LOGIN button
    Then User is logged in

  Scenario: Logged in user makes a question
    Given User has logged into the app
    When  User selects a Talk
    And User hits Question Button
    Then User can make a question about that Talk