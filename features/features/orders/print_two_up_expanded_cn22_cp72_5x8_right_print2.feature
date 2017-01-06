Feature: Print 1 Intl CN22 and 1 Intl CP72 label on SDC-1200 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_cn22_cp72_5x8_right_print2
  Scenario: Print 1 Intl CN22 and 1 Intl CP72 label on SDC-1200 - left side

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | PMEI MFR Box | SDC-1200  | 234 Laurier Avenue West  | random     | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Details: Set Weight to 1 lb 1 oz
    Then Details: Select Service First-Class Mail International Large Envelope/Flat
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to Merchandise
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Letter | SDC-1200  | random           | random           | random | random  | random      | Costa Rica | random  | random  |
    Then Details: Select Service PM International Flat Rate Envelope
    Then Details: Set Weight to 1 lb 1 oz
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to Merchandise
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal

    Then Grid: Check row 2

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Print: Expect left-side label selected
    Then Print: Print
    Then Sign out
