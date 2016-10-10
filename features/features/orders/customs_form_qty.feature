Feature: Customs Form Qty > 99 is not saved correctly


  Background:
    Given I am signed in to Orders

  @customs_form_qty
  Scenario: Customs Form Qty
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then Details: Select Service Priority Mail International Package
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
    Then Customs: Set Item Qty to 100
    Then Customs: Set Item Unit Price to 11.11
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 100

    Then Customs: Add Item 2
    Then Customs: Set Item Description to item 2
    Then Customs: Set Item Qty to 99
    Then Customs: Set Item Unit Price to 22.22
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 200

    Then Mail Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement

    Then Customs: Close Modal

    Then Details: Edit Customs Form
    Then Pause for 2 seconds
    Then Customs: Expect Item 1 Description is item 1
    Then Customs: Expect Item 1 Quantity is 100

    Then Customs: Expect Item 2 Description is item 2
    Then Customs: Expect Item 2 Quantity is 99

    Then Customs: Close Modal

    Then Sign out
