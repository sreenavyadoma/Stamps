
Feature: As a batch shipper, I want to be able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given I am signed in to Orders

  @reprint_media_close @reprint
  Scenario: User Reprints Order - Closes Reprint Modal before reprint

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Details: Set Pounds to 1

    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Print

    Then Filter: Select Shipped
    Then Grid: Check New Order ID
    Then Print: Open Reprint Modal
    Then Close Reprint Modal
    Then Sign out

