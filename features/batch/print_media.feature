
Feature: Print Media

  Background:
    Given I am signed in as a batch shipper firefox

  @print_media @regression
  Scenario:  As a batch shipper, I want to be able to change my print media
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Shipping Label - 8 ½" x 11" Paper"

