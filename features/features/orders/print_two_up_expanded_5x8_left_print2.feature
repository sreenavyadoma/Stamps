Feature: Print 2 Domestic labels on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8_left_print2
  Scenario: Print 2 Domestic labels on 5.5x8.5 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PS Large Package, 5.5x8.5, 530 K Street Unit 504, San Diego CA 92101-7060
    Then on Order Details form, select service PSG Package
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PS Large Package, 5.5x8.5, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then on Order Details form, select service PSG Oversized Package
    Then on Order Details form, set Ounces to 1
    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out
