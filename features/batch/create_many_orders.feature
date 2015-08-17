
Feature: As a batch shipper, I want to be able to create and print many orders automatically

  Background:
    Given I am signed in as a batch shipper webbatch_0003/password1

  @create_many_orders
  Scenario:  Print Specified Number of Orders
    * Create 500000 new orders with Address set to random and Service set to Priority Mail Package
    * Sign out