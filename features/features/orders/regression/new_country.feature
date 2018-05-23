
@new_country
Feature:  Print new country orders

  Background:
    Given a valid user is signed in to Web Apps

  @country_code_bonaire
  Scenario: Print Bonaire, Sincd t Eustatius, and Saba orders
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |

    Then expect order details ship-to country is Bonaire, Sint Eustatius and Saba
    Then set order details service to FCMI Large Envelope/Flat
    Then set order details ounces to 2
    Then set order details pounds to 2
    Then on order details form, add item 1, qty 1, id Item 1 SKU, description Item 1 Description
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then pause for 3 seconds
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then sign out


  @country_code_curacao
  Scenario: Print Curacao
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Curacao | random  | random  |

    Then expect order details ship-to country is Curacao
    Then set order details service to FCMI Large Envelope/Flat
    Then set order details ounces to 2
    Then set order details pounds to 2
    Then on order details form, add item 1, qty 1, id Item 1 SKU, description Item 1 Description
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then pause for 3 seconds
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then sign out




