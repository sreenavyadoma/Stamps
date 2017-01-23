@bvt
Feature:  BVT Printing

  Background:
    Given I am signed in to Orders

  @bvt_printing
  Scenario:  Printing
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Select Service PM Package
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Length to 1
    Then Order Details: Set Height to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print
    Then Sign out

