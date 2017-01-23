Feature: Customs Form Qty > 99 is not saved correctly


  Background:
    Given I am signed in to Orders

  @customs_form_qty
  Scenario: Customs Form Qty
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then Order Details: Select Service PMI Package
    Then Order Details: Set Ounces to 1

    Then Order Details: Add Item 1
    Then Order Details: Set Qty to 1
    Then Order Details: Set ID to random
    Then Order Details: Set Description to random

    Then Order Details: Add Item 2
    Then Order Details: Set Qty to 2
    Then Order Details: Set ID to random
    Then Order Details: Set Description to random

    Then Order Details: Edit Customs Form

    Then Customs Form: Add Item 1
    Then Customs Form: Set Item Description to item 1
    Then Customs Form: Set Item Qty to 5
    Then Customs Form: Set Item Unit Price to 11.11
    Then Customs Form: Set Item Made In Country to United States
    Then Customs Form: Set Item Tarriff to 5

    Then Customs Form: Add Item 2
    Then Customs Form: Set Item Description to item 2
    Then Customs Form: Set Item Qty to 7
    Then Customs Form: Set Item Unit Price to 22.22
    Then Customs Form: Set Item Made In Country to United States
    Then Customs Form: Set Item Tarriff to 10

    Then Customs Form: Check I agree to the USPS Privacy Act Statement

    Then Customs Form: Close Customs Form

    Then Orders Grid: Uncheck row 1
    Then Orders Grid: Check row 1

    Then Order Details: Edit Customs Form
    Then Pause for 2 seconds
    Then Customs Form: Expect Item 1 Description is item 1
    Then Customs Form: Expect Item 1 Quantity is 5

    Then Customs Form: Expect Item 2 Description is item 2
    Then Customs Form: Expect Item 2 Quantity is 7

    Then Customs Form: Close Customs Form

    Then Sign out
