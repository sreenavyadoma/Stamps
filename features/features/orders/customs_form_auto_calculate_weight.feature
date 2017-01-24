Feature: Auto-Calculate Customs Form Weight

  Background:
    Given A user is signed in to Orders

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then On Order Details form, select service PMI Package
    Then On Order Details form, set Ounces to 4

    Then On Order Details form, Add Item 1
    Then On Order Details form, set Qty to 2
    Then On Order Details form, set ID to random
    Then On Order Details form, set Description to random

    Then On Order Details form, Add Item 2
    Then On Order Details form, set Qty to 2
    Then On Order Details form, set ID to random
    Then On Order Details form, set Description to random

    Then On Order Details form, click Edit Form button

    Then On Customs form, add associated Item 1
    Then On Customs form, set Item Description to item 1
    Then On Customs form, set Item Qty to 2
    Then On Customs form, set Item Unit Price to 1
    Then On Customs form, set Item Made In Country to United States
    Then On Customs form, set Item Tarriff to 5

    Then On Customs form, add associated Item 2
    Then On Customs form, set Item Description to item 2
    Then On Customs form, set Item Qty to 2
    Then On Customs form, set Item Unit Price to 1
    Then On Customs form, set Item Made In Country to United States
    Then On Customs form, set Item Tarriff to 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement

    Then On Customs form, click Close button

    Then In Orders Grid, expect Weight is 0 lb. 4 oz.
    Then In Orders Grid, expect Weight(lb) is 0
    Then In Orders Grid, expect Weight(oz) is 4

    Then Sign out
