Feature:  Customs Form Totals

  Background:
    Given a valid user is signed in to Web Apps

  @international_customs_form_totals
  Scenario:  Customs Form Grid - Add Items
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then on Order Details form, select service PMI Flat Rate Envelope
    Then on Order Details form, set Pounds to 3
    Then on Order Details form, set Ounces to 3
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 100.50, Made In is Zimbabwe, Tariff 100
    Then expect Customs form Total Value is 100.50
    Then add Customs form Associated Item 2, Description random, Qty 1, Price 100.25, Made In is Afghanistan, Tariff 100
    Then expect Customs form Total Value is 200.75
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then Sign out