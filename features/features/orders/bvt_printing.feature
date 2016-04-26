@bvt
Feature:  BVT Printing

  Background:
    Given I am signed in to Orders

  @bvt_printing
  Scenario:  Printing
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1
    Then Details: Set Height to 1
    Then Details: Set Width to 1
    Then Details: Set Length to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Sign out

