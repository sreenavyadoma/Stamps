Feature: Auto-Calculate Customs Form Weight

  Background:
    Given I am signed in to Orders

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then Details: Select Service Priority Mail International Package
    Then Details: Set Ounces to 4

    Then Details: Add Item 1
    Then Details: Set Qty to 2
    Then Details: Set ID to random
    Then Details: Set Description to random

    Then Details: Add Item 2
    Then Details: Set Qty to 2
    Then Details: Set ID to random
    Then Details: Set Description to random

    Then Details: Edit Customs Form

    Then Customs: Add Item 1
    Then Customs: Set Item Description to item 1
    Then Customs: Set Item Qty to 2
    Then Customs: Set Item Unit Price to 1
    Then Customs: Set Item Made In Country to United States
    Then Customs: Set Item Tarriff to 5

    Then Customs: Add Item 2
    Then Customs: Set Item Description to item 2
    Then Customs: Set Item Qty to 2
    Then Customs: Set Item Unit Price to 1
    Then Customs: Set Item Made In Country to United States
    Then Customs: Set Item Tarriff to 10
    Then Customs: Check I agree to the USPS Privacy Act Statement

    Then Customs: Close Modal

    Then Grid: Expect Weight is 0 lbs. 4 oz.
    Then Grid: Expect Weight(lbs) is 0
    Then Grid: Expect Weight(oz) is 4

    Then Sign out
