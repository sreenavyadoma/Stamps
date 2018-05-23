
Feature: As a batch shipper, I want is able to create Then Print many orders automatically

  Background:
    Given I launched the browser

  @print_many_orders
  Scenario:  Print Specified Number of Orders
    Then Print 500000 new orders with Address set to random and service set to Priority Mail Package
    Then sign out