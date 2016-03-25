Feature: Print: Print Sample - Parcel Select Ground Large Package

  Background:
    Given I am signed in to Orders

  @print_sample @print_sample_dev
  Scenario:  Parcel Select Ground Large Package
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Printer to "factory"
    Then Print: Print Sample
    Then Sign out