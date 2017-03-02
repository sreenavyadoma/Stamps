Feature: Auto-Calculate Customs Form Weight

  Background:
    Given a valid user is signed in to Web Apps

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then set Order Details Ship-To International address to
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

    Then click Order Details form Edit Form button

    Then add Customs form Associated Item 1
    Then set Customs form Associated Item 1 Description to item 1
    Then set Customs form Associated Item 1 Qty to 2
    Then set Customs form Associated Item 1 Unit Price to 1
    Then set Customs form Associated Item 1 Made In is Country to United States
    Then set Customs form Associated Item 1 Tarriff to 5

    Then add Customs form Associated Item 2
    Then set Customs form Associated Item 2 Description to item 2
    Then set Customs form Associated Item 2 Qty to 2
    Then set Customs form Associated Item 2 Unit Price to 1
    Then set Customs form Associated Item 2 Made In is Country to United States
    Then set Customs form Associated Item 2 Tarriff to 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement

    Then click Customs form Close button

    Then expect Orders Grid Weight is 0 lb. 4 oz.
    Then expect Orders Grid Weight(lb) is 0
    Then expect Orders Grid Weight(oz) is 4

    Then Sign out
