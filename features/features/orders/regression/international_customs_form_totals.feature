Feature:  Customs Form Totals

  Background:
    Given a valid user is signed in to Web Apps

  @international_customs_form_totals
  Scenario:  Customs Form Grid - Add Items
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then set Order Details form service to PMI Flat Rate Envelope
    Then set Order Details form Pounds to 3
    Then set Order Details form Ounces to 3
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 100.50, Made In Zimbabwe, Tariff 100
    Then expect Customs form Total Value is 100.50
    Then add Customs form Associated Item 2, Description random, Qty 1, Price 100.25, Made In Afghanistan, Tariff 100
    Then expect Customs form Total Value is 200.75
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out