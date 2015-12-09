
Feature: Verify Ship Works Integration

  Background:
    Given I am signed in to Orders

  @ship_works
  Scenario:  Order Details Form
    When I Add a new order
    And Expect Order Details Form Ship-From Textbox to be enabled
    And Expect Order Details Form Ship-From drop-down be enabled
    And Expect Order Details Form Ship-To Textbox to be enabled
    And Expect Order Details Form Ship-To drop-down to be enabled
    And Expect Order Details Form Ship-To text area to be enabled
    And Expect Order Details Form Phone Textbox to be enabled
    And Expect Order Details Form Email Textbox to be enabled
    And Expect Order Details Form Pounds Textbox to be enabled
    And Expect Order Details Form Ounces Textbox to be enabled
    And Expect Order Details Form Service Textbox to be enabled
    And Expect Order Details Form Service drop-down to be enabled
    And Expect Order Details Form Insured Textbox to be enabled
    And Expect Order Detials Form Tracking Textbox to be enabled
    And Expect Order Details Form Tracking drop-down to be enabled
    And Sign out







