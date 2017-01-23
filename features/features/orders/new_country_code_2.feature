Feature:  Print Bonaire, Sint Eustatius, and Saba orders

  Background:
    Given I am signed in to Orders

  @new_country_code @new_country_code_2
  Scenario: Print Bonaire, Sint Eustatius, and Saba orders
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |
       Then Order Details: Select Service FCMI Large Envelope
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Pounds to 2
    Then Order Details: Edit Customs Form
    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Pause for 3 seconds
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print
    Then Sign out
