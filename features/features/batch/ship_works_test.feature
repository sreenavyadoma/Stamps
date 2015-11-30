
Feature: Verify Ship Works Integration

  Background:
    Given I am signed in as a batch shipper

  @ship_works
  Scenario:  Order Details Form
    When I Add a new order
    And Expect Order Details Form Ship-From Textbox to be enabled
    And Expect Order Details Form Ship-From drop-down be enabled
