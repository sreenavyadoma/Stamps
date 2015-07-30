@regression
Feature: As a batch shipper, I want to be able to create and print many orders automatically

  Background:
    Given I am signed in as a batch shipper

  @print_many_orders
  Scenario:  Print Specified Number of Orders
    * Print 2 new orders with Address set to B-01634, Package, 1990 E Grand Ave, El Segundo, CA, 90245 and Service set to Priority Mail Express Medium Flat Rate Box
    * Sign out