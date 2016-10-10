
Feature: As a batch shipper, I want is able to create Then Print many orders automatically

  Background:
    Given I am signed in to Orders as auto_paginate/password1

  @create_many_orders
  Scenario:  Print Specified Number of Orders
    Then Create 500 new orders with Address set to random and Service set to Priority Mail Package
    Then Sign out