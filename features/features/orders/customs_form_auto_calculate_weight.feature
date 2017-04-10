Feature: Auto-Calculate Customs Form Weight

  Background:
    Given a valid user is signed in to Web Apps

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then set Order Details form service to PMI Package
    Then set Order Details form Ounces to 4

    Then on Order Details form, Add Item 1
    Then set Order Details form Qty to 2
    Then set Order Details form ID to random
    Then set Order Details form Description to random

    Then on Order Details form, Add Item 2
    Then set Order Details form Qty to 2
    Then set Order Details form ID to random
    Then set Order Details form Description to random

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
    Then check Customs form I agree to the USPS Privacy Act Statement

    Then close Customs Information form

    Then expect Orders Grid Weight is 0 lb. 4 oz.
    Then expect Orders Grid Weight(lb) is 0
    Then expect Orders Grid Weight(oz) is 4

    Then Sign out
