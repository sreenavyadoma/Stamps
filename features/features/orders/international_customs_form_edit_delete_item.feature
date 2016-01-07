Feature:  Customs Form Item Grid - Edit/Delete

  Background:
    Given I am signed in to Orders

  @international @customs_form_edit_delete_items
  Scenario:  Customs Form Item Grid - Edit/Delete
    And I Add a new order
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Japan | random  | random  |
    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"
    Then Set Order Details Item - Quantity 1, ID random, Description random
    And Open customs form
    Then Expect Customs Form Item Grid count to be 1
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 1000, Weight(lbs) 1, Weight(oz) 1 Origin Japan, Tariff 100
    And Add Customs Form Item 2; Description=random, Qty 2, Unit Price 2000, Weight(lbs) 2, Weight(oz) 2 Origin Afghanistan, Tariff 200
    Then Expect Customs Form Item Grid count to be 2
    And Add Customs Form Item 3; Description=random, Qty 3, Unit Price 3000, Weight(lbs) 3, Weight(oz) 3 Origin Zimbabwe, Tariff 300
    Then Expect Customs Form Item Grid count to be 3
    Then Delete Customs Form Item 3
    Then Expect Customs Form Item Grid count to be 2
    Then Delete Customs Form Item 1
    Then Expect Customs Form Item Grid count to be 1
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    And Sign out
