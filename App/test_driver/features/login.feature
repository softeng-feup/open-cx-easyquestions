Feature: Log into app

  Scenario: User logs into the app
  Given User inserts an email
  And User inserts a password
  When User hits LOGIN button
  Then User is logged in