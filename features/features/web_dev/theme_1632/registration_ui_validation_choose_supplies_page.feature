Feature: Registration Choose Supplies Page validation Theme 1632

  Background:
    Given I loaded the default registration page

  @registration_ui_validation_choose_supplies_page
  Scenario: Registration Security questions page happy path

    # Profile Page
    Then set Profile page Email to random value
    Then set Profile page Username to random value
    Then set Profile page Password to random value
    Then set Profile page Re-type password to same as previous password
    Then set Profile page Survey Question to Individual
    Then set How did you hear about us? to Magazine Ad
    Then set Profile page Promo Code to PR33-NH77
    Then continue to Membership page

    # Membership Page
    Then set Membership page member address to random address between zone 1 and 4
    Then set Membership page Company to random value
    Then set Membership page Phone to random value
    Then set Membership page Cardholder's Name to random value
    Then set Membership page Credit Card Number to default value
    Then set Membership page Month to Dec (12)
    Then set Membership page Year to this year plus 1
    Then check Membership page Terms & Conditions
    Then click Membership page Continue button

    # Choose supplies Page
    Then expect Choose Supplies page welcome_kit_message exists
    Then expect Choose Supplies page Place order button exists
    Then expect Choose Supplies page first paragraph contain Thank you for signing up for Stamps.com. Your free Welcome Kit is on its way. Included in the kit is a set of label sheets for printing stamps or shipping labels.
    Then expect Choose Supplies page second paragraph contain If you want to add a free postal scale (just pay S&H) or additional labels or supplies, please select below.
    Then expect Choose Supplies page welcome_kit_logo exists
    Then click Choose Supplies page Place Order button
