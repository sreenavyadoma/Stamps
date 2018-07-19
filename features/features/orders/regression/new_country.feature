
@new_country
Feature:  Print new country orders

  Background:
    Given a valid user is signed in to Web Apps

  @country_code_bonaire
  Scenario: Print Bonaire, Sincd t Eustatius, and Saba orders
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code| country                          | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Bonaire, Sint Eustatius and Saba | random  | random  |

    Then expect order details ship-to country is Bonaire, Sint Eustatius and Saba
    Then set order details service to FCMI Large Envelope/Flat
    Then set order details ounces to 2
    Then set order details pounds to 2
    Then add order details item 1, qty 1, id Item 1 SKU, description Item 1 Description
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then pause for 3 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button
    Then sign out


  @country_code_curacao
  Scenario: Print Curacao
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code| country | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Curacao | random  | random  |

    Then expect order details ship-to country is Curacao
    Then set order details service to FCMI Large Envelope/Flat
    Then set order details ounces to 2
    Then set order details pounds to 2
    Then add order details item 1, qty 1, id Item 1 SKU, description Item 1 Description
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then pause for 3 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button
    Then sign out




