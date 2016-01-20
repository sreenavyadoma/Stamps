Feature: Print Media - Shipping Label - 5 ½" x 8 ½"

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Shipping Label - 5 ½" x 8 ½"
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 4
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal - Set Printer to "factory"
    Then Print
    And Sign out

