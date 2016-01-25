Feature: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Weight to 1 lbs 1 oz
    Then Order Details: Set Dimensions to Length 1 Width 1 Height 1
    Then Order Details: Set Insure For to $1.09
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Toolbar: Print
    Then Sign out
