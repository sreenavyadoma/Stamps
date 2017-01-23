
Feature: Orders Grid: Tracking & Order Status

  Background:
    Given I am signed in to Orders

  @grid_insured_value
  Scenario: Tracking & Order Status
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 5
    Then Order Details: Check Insure-For checkbox
    Then Order Details: Set Insure-For to $52.99
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Pause for 1 second
    Then Orders Grid: Expect Insured Value is $52.99
    Then Pause for 1 second
    Then Order Details: Uncheck Insure-For checkbox
    Then Order Details: Select Service PM Package
    Then Order Details: Uncheck Insure-For checkbox
    Then Order Details: Set Tracking to Signature Required
    Then Pause for 2 seconds
    Then Orders Grid: Expect Insured Value is $0.00
    Then Pause for 1 second
    Then Sign out

