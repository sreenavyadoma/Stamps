
Feature: Print Media

  Background:
    Given I am signed in as a batch shipper ff/qacc/auto15/password1

  @print_media @regression
  Scenario:  As a batch shipper, I want to be able to change my print media
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Pounds to 1
    Then Set single-order form Ounces to 1
    Then Set single-order form Width to 1
    Then Set single-order form Height to 1
    Then Set single-order form Length to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Open Print Modal
    Then Select Print Media "Roll - 4 ?" x 6 ¼" Shipping Label"
    Then Select Printer "Smart Label Printer 440"
    Then Click Print Modal - Print button