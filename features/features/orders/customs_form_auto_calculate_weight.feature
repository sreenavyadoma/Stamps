Feature: Auto-Calculate Customs Form Weight

  Background:
    Given I am signed in to Orders

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then Details: Select Service Priority Mail International Package/Flat/Thick Envelope
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
    Then Customs: Set Item Qty to 2
    Then Customs: Set Item Unit Price to 11.11
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 5

    Then Customs: Add Item 2
    Then Customs: Set Item Description to item 2
    Then Customs: Set Item Qty to 4
    Then Customs: Set Item Unit Price to 22.22
    Then Customs: Set Item Origin Country to United States
    Then Customs: Set Item Tarriff to 10

    Then Customs: Close Form

    Then Details: Edit Customs Form
    Then Pause for 2 seconds
    Then Customs: Expect Item 1 Description to be item 1
    Then Customs: Expect Item 1 Unit Price to be 11.11
    Then Customs: Expect Item 1 Origin Country to be United States
    Then Customs: Expect Item 1 Tariff to be 5

    Then Customs: Expect Item 2 Description to be item 2
    Then Customs: Expect Item 2 Unit Price to be 22.22
    Then Customs: Expect Item 2 Origin Country to be United States
    Then Customs: Expect Item 2 Tariff to be 10

    Then Customs: Close Form

    Then Sign out
