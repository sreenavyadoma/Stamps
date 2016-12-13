Feature:  Customs Form Item Grid - Edit/Delete

  Background:
    Given I am signed in to Orders

  @international_customs_form_edit_delete_item
  Scenario:  Customs Form Item Grid - Edit/Delete
    Then Toolbar: Add
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Japan | random  | random  |
    Then Details: Set Ounces to 5
    Then Details: Select Service Priority Mail International Flat Rate Envelope
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Edit Customs Form
    Then Customs: Expect Item Grid count is 1
    Then Customs: Add Item 1, Description random, Qty 1, Price 1000, Origin Japan, Tariff 100
    Then Customs: Add Item 2, Description random, Qty 2, Price 2000, Origin Afghanistan, Tariff 200
    Then Customs: Expect Item Grid count is 2
    Then Customs: Add Item 3, Description random, Qty 3, Price 3000, Origin Zimbabwe, Tariff 300
    Then Customs: Expect Item Grid count is 3
    Then Customs: Delete Item 3
    Then Customs: Expect Item Grid count is 2
    Then Customs: Delete Item 1
    Then Customs: Expect Item Grid count is 1
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Sign out