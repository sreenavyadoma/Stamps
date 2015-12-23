Feature:  New Country Code for Curacao and Country Bonaire, Sint Eustatius, and Saba


  Background:
    Given I am signed in to Orders

  @new_country_code
  Scenario: User Able to Selects new Country Curacao

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Curacao
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To country to Bonaire, Sint Eustatius and Saba



  #User Able to Print with  new   country Curacao
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Curacao | random  | random  |
    Then Set Order Details Ship-To country to Curacao
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    Then Set Order Details Ounces to 2
    Then Set Order Details Pounds to 2
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    And Print
    Then Sign out


     #User Able to Print with  new   country Country Bonaire, Sint Eustatius, and Saba
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
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    And Print
    Then Sign out
