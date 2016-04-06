Feature: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_cp72_paper_left
  Scenario: Print 3 Domestic, 3 Intl CP72 labels on 8.5x11 - left side

    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PME FR Envelope, 5.5x8.5, 26930 NE 152nd St., Duvall WA 98019-8316
    Then Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PME LFR Envelope, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PME PFR Envelope, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Box | 5.5x8.5  | random           | random           | random | random  | random      | Spain | random  | random  |
    Then Details: Set Service to "Priority Mail International Large Flat Rate Box"
    Then Details: Set Ounces to 1
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI Pkg-Flat-Env | 5.5x8.5 | random           | random           | random | random  | random      | Turkey | random  | random  |
    Then Details: Set Service to "Priority Mail Express International Package"
    Then Details: Set Ounces to 1
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI FR Envelope | 5.5x8.5 | random           | random           | random | random  | random      | Argentina | random  | random  |
    Then Details: Set Service to "Priority Mail Express International Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3
    Then Grid: Check row 4
    Then Grid: Check row 5
    Then Grid: Check row 6
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print
    Then Sign out
