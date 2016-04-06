Feature: Customs Form Qty
  Customs: Qty > 99 is not saved correctly

  Background:
    Given I am signed in to Orders

  @customs_form_qty
  Scenario: Customs Form Qty
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1  | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | Customs Form Qty | Customs Form Qty  | random          | random | random   | random      | random   | France | random  | random  |
    Then Details: Set Service to "Priority Mail Express International Legal Flat Rate Envelope"
    Then Details: Set Ounces to 1

    Then Details: Add Item 1
    Then Details: Set Qty to 1
    Then Details: Set ID to random
    Then Details: Set Description to random

    Then Details: Add Item 2
    Then Details: Set Qty to 2
    Then Details: Set ID to random
    Then Details: Set Description to random

    Then Open Customs Form

    Then Customs: Add Item 1
    Then Customs: Set Item Description to item 1
    Then Customs: Set Item Qty to 100
    Then Customs: Set Item Unit Price to 10.99
    Then Customs: Set Item Pounds to 1
    Then Customs: Set Item Ounces to 1
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 100

    Then Customs: Add Item 2
    Then Customs: Set Item Description to item 2
    Then Customs: Set Item Qty to 99
    Then Customs: Set Item Unit Price to 10.99
    Then Customs: Set Item Pounds to 2
    Then Customs: Set Item Ounces to 2
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 200

    Then Close Customs Form

    Then Open Customs Form

    Then Customs: Expect Item Count is 1, Description is item 1, Qty is 100, Price is 10.99, Lbs is 1, Oz is 1 Origin Country is United States and Tariff is 100
    Then Customs: Expect Item Count is 2, Description is item 2, Qty is 99, Price is 10.99, Lbs is 2, Oz is 2 Origin Country is United States and Tariff is 200

    Then Close Customs Form

    Then Sign out
