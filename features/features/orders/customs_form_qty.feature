Feature: Print 1 Intl CP72 label on 4x6 Roll

  Background:
    Given I am signed in to Orders

  @customs_form_qty
  Scenario: Print 1 Intl CP72 label on 4x6 Roll
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then Details: Set Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Open Customs Form
    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print: Set Media "Roll - 4" x 6" Shipping Label"
    Then Print: Print Sample
    Then Toolbar: Print
    Then Sign out
