Feature: FCM Package Rates

  Background:
    Given excel rate sheet is loaded

  @rates_fcm_package
  Scenario: FCM Package
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then run rate test FCM Package
    Then Rates: Number of failed test should be less than 1
    Then Sign out