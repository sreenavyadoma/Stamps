Feature: Print Media - Roll - 4" x 6" Shipping Label

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Roll - 4" x 6" Shipping Label
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 5
    Then Open Print Modal
    Then Select Print Media "Roll - 4" x 6" Shipping Label"
    Then Print