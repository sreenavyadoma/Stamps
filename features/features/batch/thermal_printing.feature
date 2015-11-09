
Feature: Thermal Printer

  Background:
    Given I am signed in as a batch shipper

  @thermal_printing
  Scenario:  As a batch shipper, I want to be able to change my print media
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    Then Set Order Form Pounds to 1
    Then Set Order Form Ounces to 1
    Then Set Order Form Width to 1
    Then Set Order Form Height to 1
    Then Set Order Form Length to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Roll - 4" x 6" Shipping Label"
    Then Select Printer "DYMO LabelWriter 4XL"
    Then Print
    And Sign out
