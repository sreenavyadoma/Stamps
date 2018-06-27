Feature: Auto-Calculate Customs Form Weight

  Background:
    Given a valid user is signed in to Web Apps

  @customs_form_auto_calculate_weight
  Scenario: Auto-Calculate Customs Form Weight
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province | postal_code | country  | phone  |  email  |
      | random | random  | random           | random | random   | random      | random   | France | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 4

    Then on order details form, add item 1
    Then set Order Details qty to 2
    Then set Order Details ID to random
    Then set Order Details description to random

    Then on order details form, add item 2
    Then set Order Details qty to 2
    Then set Order Details ID to random
    Then set Order Details description to random

    Then click order details form customs form button

    Then add customs associated item 1
    Then set customs associated item 1 description to item 1
    Then set customs associated item 1 qty to 2
    Then set customs associated item 1 unit price to 1
    Then set customs associated item 1 made in United States
    Then set customs associated item 1 Tarriff to 5

    Then add customs associated item 2
    Then set customs associated item 2 description to item 2
    Then set customs associated item 2 qty to 2
    Then set customs associated item 2 unit price to 1
    Then set customs associated item 2 made in United States
    Then set customs associated item 2 Tarriff to 10
    Then check customs form i agree to the usps privacy act statement

    Then close customs information form

    #Then expect orders grid weight is 0 lb. 4 oz.
    #Then expect orders grid Weight(lb) is 0
    #Then expect orders grid Weight(oz) is 4

    Then sign out
