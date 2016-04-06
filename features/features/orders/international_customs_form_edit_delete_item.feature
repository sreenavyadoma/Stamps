Feature:  Customs Form Item Grid - Edit/Delete

  Background:
    Given I am signed in to Orders

  @international_customs_form_edit_delete_item
  Scenario:  Customs Form Item Grid - Edit/Delete
    Then Add New Order
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Japan | random  | random  |
    Then Details: Set Ounces to 5
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Open Customs Form
    Then Customs: Expect Item Grid count to be 1
    Then Customs: Add Item 1, Description random, Qty 1, Price 1000, Lbs 1, Oz 1 Origin Japan, Tariff 100
    Then Customs: Add Item 2, Description random, Qty 2, Price 2000, Lbs 2, Oz 2 Origin Afghanistan, Tariff 200
    Then Customs: Expect Item Grid count to be 2
    Then Customs: Add Item 3, Description random, Qty 3, Price 3000, Lbs 3, Oz 3 Origin Zimbabwe, Tariff 300
    Then Customs: Expect Item Grid count to be 3
    Then Customs: Delete Item 3
    Then Customs: Expect Item Grid count to be 2
    Then Customs: Delete Item 1
    Then Customs: Expect Item Grid count to be 1
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Sign out