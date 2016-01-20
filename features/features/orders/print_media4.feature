Feature: Print Media - Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 2
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print Modal - Set Printer to "factory"
    Then Toolbar - Print
    And Sign out

