Feature:  Customs Form Item Grid - Edit/Delete

  Background:
    Given I am signed in to Orders

  @international @customs_form_edit_delete_items
  Scenario:  Customs Form Item Grid - Edit/Delete
    When Add New Order
    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Japan | random  | random  |
    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail International Flat Rate Envelope"
    Then Order Details - Add Item 1 - Qty 1, ID random, Description random
    And Open Customs Form
    Then Expect Customs Form Item Grid count to be 1
    And Customs Form - Add Item 1 - Description random, Qty 1, Price 1000, Lbs 1, Oz 1 Origin Japan, Tariff 100
    And Customs Form - Add Item 2 - Description random, Qty 2, Price 2000, Lbs 2, Oz 2 Origin Afghanistan, Tariff 200
    Then Expect Customs Form Item Grid count to be 2
    And Customs Form - Add Item 3 - Description random, Qty 3, Price 3000, Lbs 3, Oz 3 Origin Zimbabwe, Tariff 300
    Then Expect Customs Form Item Grid count to be 3
    Then Delete Customs Form Item 3
    Then Expect Customs Form Item Grid count to be 2
    Then Delete Customs Form Item 1
    Then Expect Customs Form Item Grid count to be 1
    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    And Sign out

#todo-rob affected