Feature: FCM Package Rates

  Background:
    Given Start test driver
    Given sign-in to orders
    Given excel rate sheet is loaded
    Given prepare environment for ratings test

  @rates_orders_fcm_package
  Scenario: FCM Package
    Then run rate test FCM Package
    Then Rates: Number of failed test should be less than 1
    Then sign out