Feature:  Print Bonaire, Sint Eustatius, and Saba orders

  Background:
    Given I am signed in to Orders

  @new_country_code @new_country_code_2
  Scenario: Print Bonaire, Sint Eustatius, and Saba orders
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |
       Then Details: Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 2
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Pause for 3 seconds
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Sign out
