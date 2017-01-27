Feature:  Customs Form Item Grid - Edit/Delete

  Background:
    Given a valid user is signed in to Web Apps

  @international_customs_form_edit_delete_item
  Scenario:  Customs Form Item Grid - Edit/Delete
    Then In Orders Toolbar, click Add button
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Japan | random  | random  |
    Then On Order Details form, set Ounces to 5
    Then On Order Details form, select service PMI Flat Rate Envelope
    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then On Order Details form, click Edit Form button
    Then On Customs form, expect Item Grid count is 1
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1000, Origin Japan, Tariff 100
    Then On Customs form, add associated Item 2, Description random, Qty 2, Price 2000, Origin Afghanistan, Tariff 200
    Then On Customs form, expect Item Grid count is 2
    Then On Customs form, add associated Item 3, Description random, Qty 3, Price 3000, Origin Zimbabwe, Tariff 300
    Then On Customs form, expect Item Grid count is 3
    Then On Customs form, Delete Item 3
    Then On Customs form, expect Item Grid count is 2
    Then On Customs form, Delete Item 1
    Then On Customs form, expect Item Grid count is 1
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then Sign out