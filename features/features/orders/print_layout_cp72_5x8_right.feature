Feature: Print 1 Intl CP72 label on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_layout_cp72_5x8_right
  Scenario: Print 1 Intl CP72 label on 5.5x8.5 - right side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name              | company   | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFR Envelope |  5.5x8.5 Right Side 1  | random       | random           | random | random  | random      | Argentina | random  | random  |
    Then Details: Set Service to "Priority Mail Express International Padded Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Print: Print
    Then Sign out
