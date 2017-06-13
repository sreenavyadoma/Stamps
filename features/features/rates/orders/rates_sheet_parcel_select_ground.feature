Feature: Parcel Select Ground Rates

  Background:
    Given excel rate sheet is loaded

  @rates_parcel_select_ground_zone_1
  Scenario: Parcel Select Ground Zone 1
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 1
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_parcel_select_ground_zone_2
  Scenario: Parcel Select Ground Zone 2
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 2
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_parcel_select_ground_zone_3
  Scenario: Parcel Select Ground Zone 3
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 3
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_parcel_select_ground_zone_4
  Scenario: Parcel Select Ground Zone 4
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 4
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_parcel_select_ground_zone_5
  Scenario: Parcel Select Ground Zone 5
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 5
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_parcel_select_ground_zone_6
  Scenario: Parcel Select Ground Zone 6
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 6
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_parcel_select_ground_zone_7
  Scenario: Parcel Select Ground Zone 7
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 7
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_parcel_select_ground_zone_8
  Scenario: Parcel Select Ground Zone 8
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 8
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_parcel_select_ground_zone_9
  Scenario: Parcel Select Ground Zone 9
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test Parcel Select Ground in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then Sign out