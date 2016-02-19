Feature: Print Media - Roll - 4 ⅛" x 6 ¼" Shipping Label

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Toolbar: Print
    Then Sign out

