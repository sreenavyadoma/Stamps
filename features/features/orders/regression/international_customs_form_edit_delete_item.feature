Feature:  Customs Form Item Grid - Edit/Delete

  Background:
    Given a valid user is signed in to Web Apps

  @international_customs_form_edit_delete_item
  Scenario:  Customs Form Item Grid - Edit/Delete
    Then add new order
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Japan | random  | random  |
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then click Order Details form Edit Form button
    Then expect Customs form Associated Item Grid count is 1
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1000, Made In Japan, Tariff 100
    Then add Customs form Associated Item 2, Description random, Qty 2, Price 2000, Made In Afghanistan, Tariff 200
    Then expect Customs form Associated Item Grid count is 2
    Then add Customs form Associated Item 3, Description random, Qty 3, Price 3000, Made In Zimbabwe, Tariff 300
    Then expect Customs form Associated Item Grid count is 3
    Then delete Customs form Associated Item 3
    Then expect Customs form Associated Item Grid count is 2
    Then delete Customs form Associated Item 1
    Then expect Customs form Associated Item Grid count is 1
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out