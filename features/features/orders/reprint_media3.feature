
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media @reprint
  Scenario: User Reprints Order - International | CN22

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | 5.5x8.5 | random           | random           | random | random  | random      | Norway | random  | random  |
    Then Details: Select Service First-Class Mail International Large Envelope/Flat
    Then Details: Set Ounces to 1

    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Gift"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal

    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Print

    Then Filter: Select Shipped
    Then Grid: Check Saved Order ID
    Then Print: Open Reprint Modal
    Then RePrint: Reprint

    Then Sign out

