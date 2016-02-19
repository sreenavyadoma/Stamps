
Feature: As a batch shipper, I want to be able to create Then Print many orders automatically

  Background:
    Given I am signed in to Orders using ff

  @print_many_orders
  Scenario:  Print Specified Number of Orders
    Then Print 500000 new orders with Address set to random and Service set to Priority Mail Package
    Then Sign out