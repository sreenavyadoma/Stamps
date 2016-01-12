Feature: Print 2 Intl CN22 labels on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 2 Intl CN22 labels on 8.5x11 - right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Right Side 2 | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set Order Details Service to "Priority Mail International Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side 1 | random           | random           | random | random  | random      | Japan | random  | random  |
    Then Set Order Details Service to "Priority Mail International Legal Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 2 label sheets
    Then Print
    Then Sign out
