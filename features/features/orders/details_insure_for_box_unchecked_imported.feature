
Feature: Order Details Insure-For box value - External Orders
  If Insure-For Box is Unchecked, Show NO Value in the Amount Field.
  If Insure-For checkbox is checked, then the Insure-For field should show its real value (which may or may not be $0.00).

  Background:
    Given I am signed in to Orders

  @details_insure_for_box_unchecked_imported
  Scenario: Insure-For - External Orders
    Then Grid: Check Environment Order ID
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Check Insure-For checkbox
    Then Details: Expect Insure-For Textbox is enabled
    Then Details: Set Insure-For to $100.00
    Then Pause for 2 seconds
    Then Details: Expect Insure-For is $100.00
    Then Details: Expect Insure-For Cost is greater than $1.00
    #Then Grid: Expect Insured Value is $100.00
    Then Details: Uncheck Insure-For checkbox
    Then Pause for 2 seconds
    Then Details: Expect Insure-For Textbox is disabled
    Then Details: Expect Insure-For is $0.00
    Then Details: Expect Insure-For Cost is $0.00
    #Then Grid: Expect Insured Value is $0.00

    Then Sign out

