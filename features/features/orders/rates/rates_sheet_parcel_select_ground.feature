Feature: Parcel Select Ground Rates

  Background:
    Given excel rate sheet is loaded

  @rates_parcel_select_ground
  Scenario: Parcel Select Ground
    And a valid user is signed in to Web Apps
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo
    Then run rate test Parcel Select Ground in Zone 1
    Then run rate test Parcel Select Ground in Zone 2
    Then run rate test Parcel Select Ground in Zone 3
    Then run rate test Parcel Select Ground in Zone 4
    Then run rate test Parcel Select Ground in Zone 5
    Then run rate test Parcel Select Ground in Zone 6
    Then run rate test Parcel Select Ground in Zone 7
    Then run rate test Parcel Select Ground in Zone 8
    Then run rate test Parcel Select Ground in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then Sign out
