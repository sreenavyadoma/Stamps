Feature: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_sdc1200_4x6_left_print1
  Scenario: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details: Select Service PM Package
    Then Order Details: Set Weight to 1 lb 1 oz
    Then Order Details: Set Dimensions to Length 1 Width 1 Height 1
    Then Order Details: Set Insure-For to $1.09
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select right-side label
    Then Print Modal: Expect right-side label selected
    Then Print Modal: Print
    Then Sign out
