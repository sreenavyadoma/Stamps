
Feature: in Orders Grid, Tracking & Order Status

  Background:
    Given a valid user is signed in to Web Apps

  @grid_insured_value
  Scenario: Tracking & Order Status
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PM Flat Rate Envelope
    Then on Order Details form, check Insure-For checkbox
    Then set Order Details form Insure-For to $52.99
    Then Pause for 1 second
    Then expect Orders Grid Insured Value is $52.99
    Then Pause for 1 second
    Then on Order Details form, uncheck Insure-For checkbox
    Then set Order Details form service to PM Package
    Then on Order Details form, uncheck Insure-For checkbox
    Then set Order Details form Tracking to Signature Required
    Then Pause for 2 seconds
    Then expect Orders Grid Insured Value is $0.00
    Then Pause for 1 second
    Then Sign out

