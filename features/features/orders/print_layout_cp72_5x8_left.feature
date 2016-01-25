Feature: Print 1 Intl CP72 label on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_layouts_cn22_cp72
  Scenario: Print 1 Intl CP72 label on 5.5x8.5 - left side
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | China | random  | random  |
    Then Order Details: Set Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Order Details: Set Ounces to 1
    And Open Customs Form
    Then Customs Form: Set Package Contents to "Merchandise"
    And Customs Form: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print
    Then Sign out
