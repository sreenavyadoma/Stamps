
Feature: Order Details Insure-For box value - External Orders
  If Insure-For Box is Unchecked, Show NO Value in the Amount Field.
  If Insure-For checkbox is checked, then the Insure-For field should show its real value (which may or may not be $0.00).

  Background:
    Given I am signed in to Orders

  @details_insure_for_box_unchecked
  Scenario: Insure-For - External Orders
    Then Grid: Check Order ID AB-1018
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Check Insure-For checkbox
    Then Details: Expect Insure-For Textbox to be enabled
    Then Details: Set Insure-For to $100.00
    Then Pause for 1 second
    Then Grid: Expect Insured Value to be $100.00
    Then Details: Uncheck Insure-For checkbox
    Then Pause for 1 second
    Then Details: Expect Insure-For Textbox to be disabled
    Then Grid: Expect Insured Value to be $0.00

    Then Sign out

