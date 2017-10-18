
@new_country
Feature:  Print new country orders

  Background:
    Given a valid user is signed in to Web Apps

  @country_code_bonaire
  Scenario: Print Bonaire, Sincd t Eustatius, and Saba orders
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |

    Then expect Order Details form Ship-To Country is Bonaire, Sint Eustatius and Saba
    Then set Order Details form service to FCMI Large Envelope
    Then set Order Details form Ounces to 2
    Then set Order Details form Pounds to 2
    Then on Order Details form, Add Item 1, Qty 1, ID Item 1 SKU, Description Item 1 Description
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Pause for 3 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Orders print modal printer
    Then click print modal print button
    Then Sign out


  @country_code_curacao
  Scenario: Print Curacao
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Curacao | random  | random  |

    Then expect Order Details form Ship-To Country is Curacao
    Then set Order Details form service to FCMI Large Envelope
    Then set Order Details form Ounces to 2
    Then set Order Details form Pounds to 2
    Then on Order Details form, Add Item 1, Qty 1, ID Item 1 SKU, Description Item 1 Description
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Pause for 3 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Orders print modal printer
    Then click print modal print button
    Then Sign out




