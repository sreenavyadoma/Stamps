Feature: Print Media - Roll - 4 ⅛" x 6 ¼" Shipping Label

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Roll - 4 ⅛" x 6 ¼" Shipping Label
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Set Print Modal Printer to "factory"
    Then Print
    And Sign out

