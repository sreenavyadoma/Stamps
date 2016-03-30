Feature: Print 2 Intl CN22 labels on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 2 Intl CN22 labels on 5.5x8.5 - right side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Lg Env-Flat | 5.5x8.5 Right Side 2 | random           | random           | random | random  | random      | Croatia | random  | random  |
    Then Details: Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Details: Set Ounces to 1
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Pkg-Thick Env | 5.5x8.5 Right Side 1 | random           | random           | random | random  | random      | India | random  | random  |
    Then Details: Set Service to "First-Class Mail International Package/Thick Envelope"
    Then Details: Set Ounces to 1
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Toolbar: Print


    Then Sign out
