Feature: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾" right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_sdc1200_4x6_right_print1
  Scenario: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾" right side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then Details: Select Service PM Package
    Then Details: Set Weight to 1 lb 1 oz
    Then Details: Set Dimensions to Length 1 Width 1 Height 1
    Then Details: Set Insure-For to $1.09
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print: Set Printer to "Designer"
    Then Print: Select right-side label
    Then Print: Expect right-side label selected
    Then Print: Print
    Then Sign out
