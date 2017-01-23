Feature: Print Modal: Print Sample - Priority Mail Regional Rate Box A

  Background:
    Given I am signed in to Orders

  @print_sample_pm_regional_rate_box_a
  Scenario:  Priority Mail Regional Rate Box A
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Set Ounces to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print Sample
    Then Sign out
