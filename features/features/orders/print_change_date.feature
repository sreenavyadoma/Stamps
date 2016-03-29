
Feature:  Order Details Form - Reference # Field
  Add Reference # Field and Print Reference # Checkbox

  Background:
    Given I am signed in to Orders

  @print_change_date
  Scenario: Reference Number
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Details: Set Ounces to 2

    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Set Ship Date to today plus 2
    Then Pause for 4 seconds
    Then Toolbar: Print
    Then Pause for 4 seconds
    Then Sign out


