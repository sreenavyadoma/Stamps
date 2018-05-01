Feature:  BVT tests for Orders

  Background:
    Given Start test driver

  @healthcheck
  Scenario: Orders Healthcheck
    Then Verify Health Check for Orders

  @healthcheck
  Scenario: Address Book Healthcheck
    Then Verify Health Check for Address Book

  @healthcheck
  Scenario: OR Reports Healthcheck
    Then Verify Health Check for OR Reports

  @healthcheck
  Scenario: Postage Tools Healthcheck
    Then Verify Health Check for Postage Tools


  @authentication
  Scenario: Orders Authentication Test
    Then visit Orders landing page
    Then sign-in to Orders
    Then sign-out of SDC Website

  @bvt_new_order
  Scenario:  BVT Add a new order
    Then visit Orders landing page
    Then sign-in to Orders
    Then add order 1
    Then add order 2
    Then add order 3
    Then set Order Details Ship-To to random address between zone 9
    Then set Order Details service to PM Package
    Then set Order Details Pounds to 1
    Then set Order Details Ounces to 1
    Then set Order Details Insure-For to $1.00
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1
#  # Orders Grid Operations
    Then uncheck Orders Grid row 1
    Then expect Orders Grid Pounds is 1
    Then expect Orders Grid Ounces is 1
    Then expect Orders Grid Weight is 1 lb. 1 oz.
    Then expect Orders Grid Insured Value is $1.00
    Then sign-out of SDC Website
