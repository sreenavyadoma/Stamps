
Feature: Verify Ship Works Integration

  Background:
    Given I am signed in to Orders

  @ship_works
  Scenario:  Order Details Form
    Then Add New Order
    And Order Details: Expect Ship-From Textbox to be enabled
    And Order Details: Expect Ship-From drop-down be enabled
    And Order Details: Expect Ship-To Textbox to be enabled
    And Order Details: Expect Ship-To drop-down to be enabled
    And Order Details: Expect Ship-To text area to be enabled
    And Order Details: Expect Phone Textbox to be enabled
    And Order Details: Expect Email Textbox to be enabled
    And Order Details: Expect Pounds Textbox to be enabled
    And Order Details: Expect Ounces Textbox to be enabled
    And Order Details: Expect Service Textbox to be enabled
    And Order Details: Expect Service drop-down to be enabled
    And Order Details: Expect Insured Textbox to be enabled
    And Expect Order Detials Form Tracking Textbox to be enabled
    And Order Details: Expect Tracking drop-down to be enabled
    And Sign out







