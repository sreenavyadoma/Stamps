Feature:  Customs Form Totals

  Background:
    Given I am signed in to Orders

  @order_details_form
  Scenario:  Customs Form Grid - Add Items
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Zimbabwe | random  | random  |
    Then Order Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Order Details: Set Pounds to 3
    Then Order Details: Set Ounces to 3
    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Sign out
    #As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]



