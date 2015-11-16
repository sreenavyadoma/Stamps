
Feature: As a batch shipper, I want to be able to create and print many orders automatically

  Background:
    Given I am signed in as batch shipper auto_paginate/password1

  @create_many_orders
  Scenario:  Print Specified Number of Orders
    Then Create 500 new orders with Address set to random and Service set to Priority Mail Package
    And Sign out