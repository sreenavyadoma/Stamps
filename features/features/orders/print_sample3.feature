Feature: Print Sample - Priority Mail Regional Rate Box A

  Background:
    Given I am signed in to Orders

  @print_sample
  Scenario:  Priority Mail Regional Rate Box A
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Regional Rate Box A"
    Then Order Details - Set Ounces to 1
    Then Open Print Modal
    Then Print Modal - Set Printer to "factory"
    Then Print Sample
    And Sign out
