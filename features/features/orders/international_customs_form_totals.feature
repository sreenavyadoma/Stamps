Feature:  Customs Form Totals

  Background:
    Given a valid user is signed in to Web Apps

  @international_customs_form_totals
  Scenario:  Customs Form Grid - Add Items
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then on Order Details form, select service PMI Flat Rate Envelope
    Then on Order Details form, set Pounds to 3
    Then on Order Details form, set Ounces to 3
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then on Order Details form, click Edit Form button
    Then on Customs form, add associated Item 1, Description random, Qty 1, Price 100.50, Origin Zimbabwe, Tariff 100
    Then on Customs form, expect Total Value is 100.50
    Then on Customs form, add associated Item 2, Description random, Qty 1, Price 100.25, Origin Afghanistan, Tariff 100
    Then on Customs form, expect Total Value is 200.75
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then Sign out