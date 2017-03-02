
Feature: in Orders Grid, Tracking & Order Status

  Background:
    Given a valid user is signed in to Web Apps

  @grid_insured_value
  Scenario: Tracking & Order Status
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 5
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, check Insure-For checkbox
    Then on Order Details form, set Insure-For to $52.99
    Then Pause for 1 second
    Then expect Orders Grid Insured Value is $52.99
    Then Pause for 1 second
    Then on Order Details form, uncheck Insure-For checkbox
    Then on Order Details form, select service PM Package
    Then on Order Details form, uncheck Insure-For checkbox
    Then on Order Details form, set Tracking to Signature Required
    Then Pause for 2 seconds
    Then expect Orders Grid Insured Value is $0.00
    Then Pause for 1 second
    Then Sign out

