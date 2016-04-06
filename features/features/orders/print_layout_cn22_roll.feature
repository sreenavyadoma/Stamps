Feature: Print 1 Intl CN22 label on 4x6 Roll

  Background:
    Given I am signed in to Orders

  @print_layout_cn22_roll
  Scenario: Print 1 Intl CN22 label on 4x6 Roll
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | FCMI PTE | 4x6 Roll  | random           | random           | random | random  | random      | Norway | random  | random  |
    Then Details: Set Service to "First-Class Mail International Package/Thick Envelope"
    Then Details: Set Ounces to 1
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check  I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Open Print Modal
    Then Print: Set Media "Roll - 4" x 6" Shipping Label"
    Then Toolbar: Print
    Then Sign out
