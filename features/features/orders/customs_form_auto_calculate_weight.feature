Feature: Auto-Calculate Customs Form Weight

  Background:
    Given I am signed in to Orders

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then Order Details: Select Service PMI Package
    Then Order Details: Set Ounces to 4

    Then Order Details: Add Item 1
    Then Order Details: Set Qty to 2
    Then Order Details: Set ID to random
    Then Order Details: Set Description to random

    Then Order Details: Add Item 2
    Then Order Details: Set Qty to 2
    Then Order Details: Set ID to random
    Then Order Details: Set Description to random

    Then Order Details: Edit Customs Form

    Then Customs Form: Add Item 1
    Then Customs Form: Set Item Description to item 1
    Then Customs Form: Set Item Qty to 2
    Then Customs Form: Set Item Unit Price to 1
    Then Customs Form: Set Item Made In Country to United States
    Then Customs Form: Set Item Tarriff to 5

    Then Customs Form: Add Item 2
    Then Customs Form: Set Item Description to item 2
    Then Customs Form: Set Item Qty to 2
    Then Customs Form: Set Item Unit Price to 1
    Then Customs Form: Set Item Made In Country to United States
    Then Customs Form: Set Item Tarriff to 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement

    Then Customs Form: Close Customs Form

    Then Orders Grid: Expect Weight is 0 lb. 4 oz.
    Then Orders Grid: Expect Weight(lb) is 0
    Then Orders Grid: Expect Weight(oz) is 4

    Then Sign out
