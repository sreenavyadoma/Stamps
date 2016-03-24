@bvt
Feature:  BVT Printing

  Background:
    Given I am signed in to Orders

  @bvt_printing
  Scenario:  Printing
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print
    Then Sign out

