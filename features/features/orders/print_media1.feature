Feature: Print Media - Roll - 4 ⅛" x 6 ¼" Shipping Label

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Roll - 4 ⅛" x 6 ¼" Shipping Label
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 1
    Then Open Print Modal
    Then Print Modal - Set Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print Modal - Set Printer to "factory"
    Then Print
    And Sign out

