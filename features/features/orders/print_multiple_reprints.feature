Feature: Multiple Reprints

  Background:
    Given I am signed in to Orders

  @print_multiple_reprints
  Scenario: Multiple reprints in 24 hour period

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then Order Details: Select Service MM Package
    Then Order Details: Set Ounces to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print
    Then Filter Panel: Select Shipped
    Then Orders Grid: Check saved Order ID
    Then Print Modal: Open Reprint Modal
    Then RePrint Modal: Reprint
    Then Filter Panel: Select Shipped
    Then Orders Grid: Check saved Order ID
    Then Print Modal: Open Reprint Modal
    Then RePrint Modal: Reprint

    Then Sign out