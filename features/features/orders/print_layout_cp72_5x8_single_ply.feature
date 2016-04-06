Feature: Print 1 Intl CP72 label on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_layout_cp72_5x8_single_ply
  Scenario: Print 1 single ply Intl CP72 label on 5.5x8.5 - left side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFRB |  5.5x8.5 Left Side | random       | random           | random | random  | random      | Australia | random  | random  |
    Then Details: Set Service to "Priority Mail International Large Flat Rate Box"
    Then Details: Set Ounces to 1
    Then Open Customs Form
    Then Customs: Set Package Contents to "Gift"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print
    Then Sign out
