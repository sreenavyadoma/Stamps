Feature: PME Comm Base Rates

  Background:
    Given Login and configure rate tests

  @rates_pme_comm_base_zone_1
  Scenario: PME Comm Base Zone 1
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 1
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_2
  Scenario: PME Comm Base Zone 2
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 2
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_3
  Scenario: PME Comm Base Zone 3
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 3
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_4
  Scenario: PME Comm Base Zone 4
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 4
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_5
  Scenario: PME Comm Base Zone 5
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 5
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_6
  Scenario: PME Comm Base Zone 6
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 6
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_7
  Scenario: PME Comm Base Zone 7
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 7
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_8
  Scenario: PME Comm Base Zone 8
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 8
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_9
  Scenario: PME Comm Base Zone 9
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 9
    Then Rates: Number of failed test should be less than 1
    Then sign out

  @rates_pme_comm_base_zone_1
  Scenario: PME Comm Base Zone 1
    Then set Order Details Ship-From to default
    Then run rate test PME Comm Base in Zone 1
    Then Rates: Number of failed test should be less than 1
    Then sign out



