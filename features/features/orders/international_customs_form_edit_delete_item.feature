Feature:  Customs Form Item Grid - Edit/Delete

  Background:
    Given a valid user is signed in to Web Apps

  @international_customs_form_edit_delete_item
  Scenario:  Customs Form Item Grid - Edit/Delete
    Then in Orders Toolbar, click Add button
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Japan | random  | random  |
    Then on Order Details form, set Ounces to 5
    Then on Order Details form, select service PMI Flat Rate Envelope
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then on Order Details form, click Edit Form button
    Then on Customs form, expect Associated Item Grid count is 1
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 1000, Origin Japan, Tariff 100
    Then on Customs form, add Associated Item 2, Description random, Qty 2, Price 2000, Origin Afghanistan, Tariff 200
    Then on Customs form, expect Associated Item Grid count is 2
    Then on Customs form, add Associated Item 3, Description random, Qty 3, Price 3000, Origin Zimbabwe, Tariff 300
    Then on Customs form, expect Associated Item Grid count is 3
    Then on Customs form, Delete Item 3
    Then on Customs form, expect Associated Item Grid count is 2
    Then on Customs form, Delete Item 1
    Then on Customs form, expect Associated Item Grid count is 1
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then Sign out