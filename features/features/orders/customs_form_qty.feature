Feature: Customs Form Qty > 99 is not saved correctly


  Background:
    Given I am signed in to Orders

  @customs_form_qty
  Scenario: Customs Form Qty
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then Details: Select Service PMI Package
    Then Details: Set Ounces to 1

    Then Details: Add Item 1
    Then Details: Set Qty to 1
    Then Details: Set ID to random
    Then Details: Set Description to random

    Then Details: Add Item 2
    Then Details: Set Qty to 2
    Then Details: Set ID to random
    Then Details: Set Description to random

    Then Details: Edit Customs Form

    Then Customs: Add Item 1
    Then Customs: Set Item Description to item 1
    Then Customs: Set Item Qty to 5
    Then Customs: Set Item Unit Price to 11.11
    Then Customs: Set Item Made In Country to United States
    Then Customs: Set Item Tarriff to 5

    Then Customs: Add Item 2
    Then Customs: Set Item Description to item 2
    Then Customs: Set Item Qty to 7
    Then Customs: Set Item Unit Price to 22.22
    Then Customs: Set Item Made In Country to United States
    Then Customs: Set Item Tarriff to 10

    Then Customs: Check I agree to the USPS Privacy Act Statement

    Then Customs: Close Modal

    Then Grid: Uncheck row 1
    Then Grid: Check row 1

    Then Details: Edit Customs Form
    Then Pause for 2 seconds
    Then Customs: Expect Item 1 Description is item 1
    Then Customs: Expect Item 1 Quantity is 5

    Then Customs: Expect Item 2 Description is item 2
    Then Customs: Expect Item 2 Quantity is 7

    Then Customs: Close Modal

    Then Sign out
