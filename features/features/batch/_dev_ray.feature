
Feature: Test Development

  Background:
    Given I am signed in as batch shipper webpost_0001/pass111

  @create_many_orders_for_ray
  Scenario:  Print Specified Number of Orders
    Then Create 2 new orders with Address set to random and Service set to Priority Mail Express Package
    And Sign out