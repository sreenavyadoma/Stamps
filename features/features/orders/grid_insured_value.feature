
Feature: In Orders Grid, Tracking & Order Status

  Background:
    Given A user is signed in to Orders

  @grid_insured_value
  Scenario: Tracking & Order Status
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 5
    Then On Order Details form, check Insure-For checkbox
    Then On Order Details form, set Insure-For to $52.99
    Then On Order Details form, select service PM Flat Rate Envelope
    Then Pause for 1 second
    Then In Orders Grid, expect Insured Value is $52.99
    Then Pause for 1 second
    Then On Order Details form, uncheck Insure-For checkbox
    Then On Order Details form, select service PM Package
    Then On Order Details form, uncheck Insure-For checkbox
    Then On Order Details form, set Tracking to Signature Required
    Then Pause for 2 seconds
    Then In Orders Grid, expect Insured Value is $0.00
    Then Pause for 1 second
    Then Sign out

