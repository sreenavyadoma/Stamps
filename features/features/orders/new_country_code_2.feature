Feature:  Print Bonaire, Sint Eustatius, and Saba orders

  Background:
    Given I am signed in to Orders

  @new_country_code @new_country_code_2
  Scenario: Print Bonaire, Sint Eustatius, and Saba orders
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |
       Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    Then Set Order Details Ounces to 2
    Then Set Order Details Pounds to 2
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Wait in seconds 3
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    And Print
    Then Sign out
