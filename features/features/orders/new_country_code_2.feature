Feature:  Print Bonaire, Sint Eustatius, and Saba orders

  Background:
    Given A user is signed in to Orders

  @new_country_code @new_country_code_2
  Scenario: Print Bonaire, Sint Eustatius, and Saba orders
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |
       Then On Order Details form, select service FCMI Large Envelope
    Then On Order Details form, set Ounces to 2
    Then On Order Details form, set Pounds to 2
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then Pause for 3 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then Sign out
