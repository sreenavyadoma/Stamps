Feature: User Prints 1 Domestic label on 5.5x8.5 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8_right_print1
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - right side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select right-side label
    Then in Print modal, expect right-side label selected
    Then in Print modal, click Print button
    Then Sign out


