Feature: Print 2 Intl CN22 labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_layout_cn22_paper_left_side
  Scenario: Print 2 Intl CN22 labels on 8.5x11 - left side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Left Side | random           | random           | random | random  | random      | Germany | random  | random  |
    Then Details: Set Service to "Priority Mail International Padded Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Toolbar: Add

    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side | random           | random           | random | random  | random      | Mexico | random  | random  |
    Then Details: Set Service to "Priority Mail International Legal Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form

    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Print: Open Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Print: Print
    Then Sign out
