Feature: User Prints 1 Domestic label on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_5x8_right_print1
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - right side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Ounces to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select right-side label
    Then Print Modal: Expect right-side label selected
    Then Print Modal: Print
    Then Sign out


