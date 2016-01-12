Feature:  As a batch shipper, I want to be able to print multiple labels

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Prints 1 Intl CP72, 1 Intl CN22 label on SDC-1200 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI Pkg-Flat-Env | SDC-1200  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | PMI FR Envelope | SDC-1200  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print
    Then Sign out
