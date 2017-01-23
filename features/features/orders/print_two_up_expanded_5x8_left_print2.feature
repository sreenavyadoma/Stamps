Feature: Print 2 Domestic labels on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_5x8_left_print2
  Scenario: Print 2 Domestic labels on 5.5x8.5 - left side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PS Large Package, 5.5x8.5, 530 K Street Unit 504, San Diego CA 92101-7060
    Then Order Details: Select Service PSG Package
    Then Order Details: Set Ounces to 1
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PS Large Package, 5.5x8.5, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then Order Details: Select Service PSG Oversized Package
    Then Order Details: Set Ounces to 1
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select left-side label
    Then Print Modal: Expect left-side label selected
    Then Print Modal: Print
    Then Sign out
