
Feature: Verify Ship Works Integration

  Background:
    Given I am signed in to Orders

  @ship_works
  Scenario:  Order Details Form
    Then Toolbar: Add
    Then Details: Expect Ship-From Textbox is enabled
    Then Details: Expect Ship-From drop-down be enabled
    Then Details: Expect Ship-To Textbox is enabled
    Then Details: Expect Ship-To drop-down is enabled
    Then Details: Expect Ship-To text area is enabled
    Then Details: Expect Phone Textbox is enabled
    Then Details: Expect Email Textbox is enabled
    Then Details: Expect Pounds Textbox is enabled
    Then Details: Expect Ounces Textbox is enabled
    Then Details: Expect Service Textbox is enabled
    Then Details: Expect Service drop-down is enabled
    Then Details: Expect Insure-For Textbox is enabled
    Then Expect Order Detials Form Tracking Textbox is enabled
    Then Details: Expect Tracking drop-down is enabled
    Then Sign out








