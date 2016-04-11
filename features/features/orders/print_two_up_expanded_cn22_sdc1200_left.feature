Feature:  As a batch shipper, I want to be able to print multiple labels

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_cn22_sdc1200_left
  Scenario: User Prints 1 Intl CP72, 1 Intl CN22 label on SDC-1200 - left side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI Pkg-Flat-Env | SDC-1200  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | PMI FR Envelope | SDC-1200  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Print: Open Modal
    Then Print: Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Print: Print
    Then Sign out
