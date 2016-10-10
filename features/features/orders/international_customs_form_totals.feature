Feature:  Customs Form Totals

  Background:
    Given I am signed in to Orders

  @international_customs_form_totals
  Scenario:  Customs Form Grid - Add Items
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then Details: Select Service Priority Mail International Flat Rate Envelope
    Then Details: Set Pounds to 3
    Then Details: Set Ounces to 3
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Origin Zimbabwe, Tariff 100
    Then Customs Form: Expect Total Value is 100.50
    Then Customs: Add Item 2, Description random, Qty 1, Price 100.25, Origin Afghanistan, Tariff 100
    Then Customs Form: Expect Total Value is 200.75
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Sign out