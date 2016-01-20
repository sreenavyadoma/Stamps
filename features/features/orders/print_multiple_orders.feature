
Feature: Print Multiple Orders

  Background:
    Given I am signed in to Orders

  @print_multiple_orders @print
  Scenario:  Print 2 Orders
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details - Set Ounces to 1

    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Order Details - Set Ounces to 1

    And Orders Grid - Check row 1
    And Orders Grid - Check row 2

    Then Print
    And Sign out
