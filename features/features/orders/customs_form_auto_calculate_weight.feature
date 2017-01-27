Feature: Auto-Calculate Customs Form Weight

  Background:
    Given a valid user is signed in to Web Apps

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then on Order Details form, select service PMI Package
    Then on Order Details form, set Ounces to 4

    Then on Order Details form, Add Item 1
    Then on Order Details form, set Qty to 2
    Then on Order Details form, set ID to random
    Then on Order Details form, set Description to random

    Then on Order Details form, Add Item 2
    Then on Order Details form, set Qty to 2
    Then on Order Details form, set ID to random
    Then on Order Details form, set Description to random

    Then on Order Details form, click Edit Form button

    Then on Customs form, add associated Item 1
    Then on Customs form, set Item Description to item 1
    Then on Customs form, set Item Qty to 2
    Then on Customs form, set Item Unit Price to 1
    Then on Customs form, set Item Made In Country to United States
    Then on Customs form, set Item Tarriff to 5

    Then on Customs form, add associated Item 2
    Then on Customs form, set Item Description to item 2
    Then on Customs form, set Item Qty to 2
    Then on Customs form, set Item Unit Price to 1
    Then on Customs form, set Item Made In Country to United States
    Then on Customs form, set Item Tarriff to 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement

    Then on Customs form, click Close button

    Then In Orders Grid, expect Weight is 0 lb. 4 oz.
    Then In Orders Grid, expect Weight(lb) is 0
    Then In Orders Grid, expect Weight(oz) is 4

    Then Sign out
