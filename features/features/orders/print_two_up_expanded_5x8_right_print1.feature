Feature: User Prints 1 Domestic label on 5.5x8.5 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8_right_print1
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - right side
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then On Order Details form, select service PSG Package
    Then On Order Details form, set Ounces to 1
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, select right-side label
    Then In Print modal, expect right-side label selected
    Then In Print modal, click Print button
    Then Sign out


