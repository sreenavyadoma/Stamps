Feature:  Customs Form Totals

  Background:
    Given I am signed in to Orders

  @international @international_totals
  Scenario:  Customs Form Grid - Add Items
    Then I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then Set Order Details Service to "Priority Mail International Package"
    Then Set Order Details Pounds to 3
    Then Set Order Details Ounces to 3
    Then Set Order Details Item - Quantity 1, ID random, Description random
    Then Open customs form
    Then Add Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin Zimbabwe, Tariff 100
    Then Wait in seconds 1
    Then Close Customs Form
    Then Wait in seconds 1
    Then Open customs form
    Then Wait in seconds 1
    Then Expect Customs Form Total Value to be 100.50
    Then Wait in seconds 1
    Then Close Customs Form
    Then Wait in seconds 1
    Then Open customs form
    Then Wait in seconds 1
    Then Expect Customs Form Total Pounds to be 1
    Then Wait in seconds 1
    Then Close Customs Form
    Then Wait in seconds 1
    Then Open customs form
    Then Wait in seconds 1
    Then Expect Customs Form Total Ounces to be 1
    Then Add Customs Form Item 2; Description=random, Qty 1, Unit Price 100.25, Weight(lbs) 1, Weight(oz) 1 Origin Afghanistan, Tariff 100
    Then Wait in seconds 2
    Then Close Customs Form
    Then Wait in seconds 1
    Then Open customs form
    Then Wait in seconds 1
    Then Expect Customs Form Total Value to be 200.75
    Then Wait in seconds 1
    Then Close Customs Form
    Then Wait in seconds 1
    Then Open customs form
    Then Wait in seconds 1
    Then Expect Customs Form Total Pounds to be 2
    Then Wait in seconds 1
    Then Close Customs Form
    Then Wait in seconds 1
    Then Open customs form
    Then Wait in seconds 1
    Then Expect Customs Form Total Ounces to be 2
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Sign out
