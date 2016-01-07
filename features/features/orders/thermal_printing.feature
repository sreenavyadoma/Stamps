
Feature: Thermal Printer

  Background:
    Given I am signed in to Orders

  @thermal_printing
  Scenario:  As a batch shipper, I want to be able to change my print media
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 5 through 8
    Then Set Order Details Pounds to 1
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Open Print Modal
    Then Set Print Modal Media "Roll - 4" x 6" Shipping Label"
    Then Print
    And Sign out
