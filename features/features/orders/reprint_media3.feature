
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint
  Scenario: User Reprints Order - International | CN22

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | 5.5x8.5 | random           | random           | random | random  | random      | Norway | random  | random  |
    Then Order Details: Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Order Details: Set Ounces to 1

    Then Open Customs Form
    Then Customs Form: Set Package Contents to "Gift"
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form

    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print

    Then Filter Panel - Shipped
    Then Set Orders Grid New Order ID to check
    Then Open Reprint Modal
    Then Reprint Modal: Reprint

    Then Sign out

