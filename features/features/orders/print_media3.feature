Feature: Print Media - Shipping Label - 5 ½" x 8 ½"

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Shipping Label - 5 ½" x 8 ½"
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 4
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Print
    And Sign out

