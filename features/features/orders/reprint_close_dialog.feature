
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media_close @reprint
  Scenario: User Reprints Order - Closes Reprint Modal before reprint

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Package
    Then Order Details: Set Pounds to 1

    Then Pause for 2 seconds
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print

    Then Filter Panel: Select Shipped
    Then Orders Grid: Check saved Order ID
    Then Print Modal: Open Reprint Modal
    Then Close Reprint Modal
    Then Sign out

