Feature: User Prints 1 Domestic label on 5.5x8.5 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_5x8_right_print1
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - right side
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then set Order Details form service to PSG Package
    Then set Order Details form Ounces to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then in Print modal, click Print button
    Then Sign out


