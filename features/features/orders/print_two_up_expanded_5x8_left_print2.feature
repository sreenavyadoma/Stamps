Feature: Print 2 Domestic labels on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_5x8_left_print2
  Scenario: Print 2 Domestic labels on 5.5x8.5 - left side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address PS Large Package, 5.5x8.5, 530 K Street Unit 504, San Diego CA 92101-7060
    Then Details: Select Service PSG Package
    Then Details: Set Ounces to 1
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address PS Large Package, 5.5x8.5, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then Details: Select Service PSG Oversized Package
    Then Details: Set Ounces to 1
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Print: Expect left-side label selected
    Then Print: Print
    Then Sign out
