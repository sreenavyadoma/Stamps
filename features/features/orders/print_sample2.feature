Feature: Print Modal: Print Sample - Parcel Select Ground Large Package

  Background:
    Given I am signed in to Orders

  @print_sample @print_sample_dev
  Scenario:  Parcel Select Ground Large Package
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Parcel Select Ground Large Package"
    Then Order Details: Set Ounces to 1
    Then Open Print Modal
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print Sample
    Then Sign out