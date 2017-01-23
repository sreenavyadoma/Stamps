
Feature:  Order Details Form - Reference # Field
  Add Reference # Field and Print Reference # Checkbox

  Background:
    Given I am signed in to Orders

  @details_reference_no
  Scenario: Reference Number
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Set Ounces to 2

    Then Order Details: Set Reference Number to random
    Then Order Details: Expect Reference Number is random

    Then Order Details: Set Reference Number to Rob
    Then Order Details: Expect Reference Number is Rob

    Then Print Modal: Open Print Modal
    Then Print Modal: Uncheck Print Reference # on Shipping Label
    Then Print Modal: Check Print Reference # on Shipping Label
    Then Print Modal: Check Print Reference # on Shipping Label
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print
    Then Sign out

