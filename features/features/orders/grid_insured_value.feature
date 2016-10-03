
Feature: Grid: Tracking & Order Status

  Background:
    Given I am signed in to Orders

  @grid_insured_value
  Scenario: Tracking & Order Status
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 5
    Then Details: Check Insure-For checkbox
    Then Details: Set Insure-For to $52.99
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Pause for 1 second
    Then Grid: Expect Insured Value to be $52.99
    Then Pause for 1 second
    Then Details: Uncheck Insure-For checkbox
    Then Details: Select Service Priority Mail Package
    Then Details: Uncheck Insure-For checkbox
    Then Details: Set Tracking to Signature Required
    Then Pause for 2 seconds
    Then Grid: Expect Insured Value to be $0.00
    Then Pause for 1 second
    Then Sign out

