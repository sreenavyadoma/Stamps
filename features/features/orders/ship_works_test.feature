
Feature: Verify Ship Works Integration

  Background:
    Given I am signed in to Orders

  @ship_works
  Scenario:  Order Details Form
    Then Add New Order
    And Expect Order Details Ship-From Textbox to be enabled
    And Expect Order Details Ship-From drop-down be enabled
    And Expect Order Details Ship-To Textbox to be enabled
    And Expect Order Details Ship-To drop-down to be enabled
    And Expect Order Details Ship-To text area to be enabled
    And Expect Order Details Phone Textbox to be enabled
    And Expect Order Details Email Textbox to be enabled
    And Expect Order Details Pounds Textbox to be enabled
    And Expect Order Details Ounces Textbox to be enabled
    And Expect Order Details Service Textbox to be enabled
    And Expect Order Details Service drop-down to be enabled
    And Expect Order Details Insured Textbox to be enabled
    And Expect Order Detials Form Tracking Textbox to be enabled
    And Expect Order Details Tracking drop-down to be enabled
    And Sign out







