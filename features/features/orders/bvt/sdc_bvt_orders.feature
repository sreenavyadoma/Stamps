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
    Then add new order
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


#  @bvt_orders_ship_date
  Scenario: Ship Date defaults to today
    Then visit Orders landing page
    Then sign-in to Orders
    Then set Orders Settings General postdate to now +2 hours
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then expect Print modal Ship Date is 0 days from today
    Then close Print Modal
    Then set Orders Settings General postdate to 5:00 p.m.
    Then Sign out

#  @bvt_orders_ship_date
  Scenario: Ship Date defaults to tomorrow
    Then visit Orders landing page
    Then sign-in to Orders
    Then set Orders Settings General postdate to now -2 hours
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then expect Print modal Ship Date is 1 days from today
    Then close Print Modal
    Then set Orders Settings General postdate to 5:00 p.m.
    Then Sign out

  @bvt_orders_ship_date
  Scenario: Set Ship Date to today
    Then visit Orders landing page
    Then sign-in to Orders
    Then set Orders Settings General postdate to now +2 hours
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
#    Then expect Print modal Ship Date is 0 days from today
    Then select Print modal Ship Date datepicker to today
    Then select Print modal Ship Date datepicker to today plus 1
    Then select Print modal Ship Date datepicker to today plus 2
#    Then set Print modal Ship Date to today
#    Then set Print modal Ship Date to today plus 1
#    Then set Print modal Ship Date to today plus 2
    Then close Print Modal
    Then set Orders Settings General postdate to 5:00 p.m.
    Then Sign out

