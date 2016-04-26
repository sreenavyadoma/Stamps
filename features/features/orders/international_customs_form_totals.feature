Feature:  Customs Form Totals

  Background:
    Given I am signed in to Orders

  @international_customs_form_totals
  Scenario:  Customs Form Grid - Add Items
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then Details: Select Service Priority Mail International Flat Rate Envelope
    Then Details: Set Pounds to 3
    Then Details: Set Ounces to 3
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 100.50, Lbs 2, Oz 2 Origin Zimbabwe, Tariff 100
    Then Expect Customs Form Total Value to be 100.50
    Then Expect Customs Form Total Pounds to be 2
    Then Expect Customs Form Total Ounces to be 2
    Then Customs: Add Item 2, Description random, Qty 1, Price 100.25, Lbs 1, Oz 1 Origin Afghanistan, Tariff 100
    Then Expect Customs Form Total Value to be 200.75
    Then Expect Customs Form Total Pounds to be 3
    Then Expect Customs Form Total Ounces to be 3
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Sign out