
Feature:  Order Details Form - Reference # Field
  Add Reference # Field and Print Reference # Checkbox

  Background:
    Given I am signed in to Orders

  @details_reference_no
  Scenario: Reference Number
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Set Ounces to 2

    Then Details: Set Reference Number to random
    Then Details: Expect Reference Number is random

    Then Details: Set Reference Number to Rob
    Then Details: Expect Reference Number is Rob

    Then Print: Open Modal
    Then Print: Uncheck Print Reference # on Shipping Label
    Then Print: Check Print Reference # on Shipping Label
    Then Print: Check Print Reference # on Shipping Label
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Sign out

