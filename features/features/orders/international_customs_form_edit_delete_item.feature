Feature:  Customs Form Item Grid - Edit/Delete

  Background:
    Given I am signed in to Orders

  @international_customs_form_edit_delete_item
  Scenario:  Customs Form Item Grid - Edit/Delete
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Japan | random  | random  |
    Then Order Details: Set Ounces to 5
    Then Order Details: Select Service PMI Flat Rate Envelope
    Then Order Details: Add Item 1, Qty 1, ID random, Description random
    Then Order Details: Edit Customs Form
    Then Customs Form: Expect Item Grid count is 1
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 1000, Origin Japan, Tariff 100
    Then Customs Form: Add Item 2, Description random, Qty 2, Price 2000, Origin Afghanistan, Tariff 200
    Then Customs Form: Expect Item Grid count is 2
    Then Customs Form: Add Item 3, Description random, Qty 3, Price 3000, Origin Zimbabwe, Tariff 300
    Then Customs Form: Expect Item Grid count is 3
    Then Customs Form: Delete Item 3
    Then Customs Form: Expect Item Grid count is 2
    Then Customs Form: Delete Item 1
    Then Customs Form: Expect Item Grid count is 1
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Sign out