
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint
  Scenario: User Reprints Order - International | CN22

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | 5.5x8.5 | random           | random           | random | random  | random      | Norway | random  | random  |
    Then Details: Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Details: Set Ounces to 1

    Then Open Customs Form
    Then Customs: Set Package Contents to "Gift"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Set I agree to Checked
    Then Close Customs Form

    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Toolbar: Print

    Then Filter: Select Shipped
    Then Set Orders Grid New Order ID to check
    Then Open Reprint Modal
    Then RePrint: Reprint

    Then Sign out

