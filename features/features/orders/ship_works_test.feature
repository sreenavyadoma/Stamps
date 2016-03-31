
Feature: Verify Ship Works Integration

  Background:
    Given I am signed in to Orders

  @ship_works
  Scenario:  Order Details Form
    Then Add New Order
    Then Details: Expect Ship-From Textbox to be enabled
    Then Details: Expect Ship-From drop-down be enabled
    Then Details: Expect Ship-To Textbox to be enabled
    Then Details: Expect Ship-To drop-down to be enabled
    Then Details: Expect Ship-To text area to be enabled
    Then Details: Expect Phone Textbox to be enabled
    Then Details: Expect Email Textbox to be enabled
    Then Details: Expect Pounds Textbox to be enabled
    Then Details: Expect Ounces Textbox to be enabled
    Then Details: Expect Service Textbox to be enabled
    Then Details: Expect Service drop-down to be enabled
    Then Details: Expect Insured Textbox to be enabled
    Then Expect Order Detials Form Tracking Textbox to be enabled
    Then Details: Expect Tracking drop-down to be enabled
    Then Sign out








