Feature: Customs Form Qty > 99 is not saved correctly


  Background:
    Given a valid user is signed in to Web Apps

  @customs_form_qty
  Scenario: Customs Form Qty
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then on Order Details form, select service PMI Package
    Then on Order Details form, set Ounces to 1

    Then on Order Details form, Add Item 1
    Then on Order Details form, set Qty to 1
    Then on Order Details form, set ID to random
    Then on Order Details form, set Description to random

    Then on Order Details form, Add Item 2
    Then on Order Details form, set Qty to 2
    Then on Order Details form, set ID to random
    Then on Order Details form, set Description to random

    Then click Order Details form Edit Form button

    Then add Customs form Associated Item 1
    Then set Customs form Associated Item 1 Description to item 1
    Then set Customs form Associated Item 1 Qty to 5
    Then set Customs form Associated Item 1 Unit Price to 11.11
    Then set Customs form Associated Item 1 Made In Country to United States
    Then set Customs form Associated Item 1 Tarriff to 5

    Then add Customs form Associated Item 2
    Then set Customs form Associated Item 2 Description to item 2
    Then set Customs form Associated Item 2 Qty to 7
    Then set Customs form Associated Item 2 Unit Price to 22.22
    Then set Customs form Associated Item 2 Made In Country to United States
    Then set Customs form Associated Item 1 Tarriff to 10

    Then on Customs form, check I agree to the USPS Privacy Act Statement

    Then click Customs form Close button

    Then in Orders Grid, uncheck row 1
    Then in Orders Grid, check row 1

    Then click Order Details form Edit Form button
    Then Pause for 2 seconds
    Then expect Customs form Associated Item 1 Description is item 1
    Then expect Customs form Associated Item 1 Quantity is 5

    Then expect Customs form Associated Item 2 Description is item 2
    Then expect Customs form Associated Item 2 Quantity is 7

    Then click Customs form Close button

    Then Sign out
