Feature: Print: Print Sample - Parcel Select Ground Large Package

  Background:
    Given I am signed in to Orders

  @print_sample_parcel_select_ground_large_package
  Scenario:  Parcel Select Ground Large Package
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printer to "factory"
    Then Print: Print Sample
    Then Sign out