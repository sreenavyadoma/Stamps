Feature: PME Comm Plus Rates

  Background:
    Given excel rate sheet is loaded

  @rates_pme_comm_plus_zone_1
  Scenario: PME Comm Plus Zone 1
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 1
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pme_comm_plus_zone_2
  Scenario: PME Comm Plus Zone 2
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 2
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pme_comm_plus_zone_3
  Scenario: PME Comm Plus Zone 3
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 3
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pme_comm_plus_zone_4
  Scenario: PME Comm Plus Zone 4
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 4
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pme_comm_plus_zone_5
  Scenario: PME Comm Plus Zone 5
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 5
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pme_comm_plus_zone_6
  Scenario: PME Comm Plus Zone 6
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 6
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pme_comm_plus_zone_7
  Scenario: PME Comm Plus Zone 7
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 7
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pme_comm_plus_zone_8
  Scenario: PME Comm Plus Zone 8
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 8
    Then Rates: Number of failed test should be less than 1
    Then Sign out

  @rates_pme_comm_plus_zone_9
  Scenario: PME Comm Plus Zone 9
    And a valid user is signed in to Web Apps
    Then prepare environment for ratings test
    Then set Order Details form Ship-From to default
    Then run rate test PME Comm Plus in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then Sign out

