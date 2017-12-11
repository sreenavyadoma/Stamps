Feature: FCM Package Rates

  Background:
    Given Login and configure rate tests

  @rates_fcm_package
  Scenario: FCM Package
    Then run rate test FCM Package
    Then Rates: Number of failed test should be less than 1
    Then Sign out