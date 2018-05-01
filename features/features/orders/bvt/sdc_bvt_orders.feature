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


  @bvt_orders_ship_date
  Scenario: Ship Date defaults to today
    Then visit Orders landing page
    Then sign-in to Orders
    Then Open Orders Settings General Settings
    Then set Orders Settings General postdate to now +2 hours
    Then close Orders Settings modal
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then expect Print modal Ship Date is 0 days from today
    Then close Print Modal

    Then Open Orders Settings General Settings
    Then set Orders Settings General postdate to now -2 hours
    Then close Orders Settings modal
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then expect Print modal Ship Date is 1 days from today
    Then close Print Modal

    Then Open Orders Settings General Settings
    Then set Orders Settings General postdate to now +2 hours
    Then close Orders Settings modal
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then expect Print modal Ship Date is 0 days from today
    Then set Print modal Ship Date to today
    Then set Print modal Ship Date to today plus 1
    Then set Print modal Ship Date to today plus 2
    Then set Print modal Ship Date to today
    Then expect Print modal Ship Date is 0 days from today
    Then close Print Modal
    Then Open Orders Settings General Settings
    Then set Orders Settings General postdate to 5:00 p.m.
    Then close Orders Settings modal
    Then Sign out

  @bvt_orders_ship_date_calendar
  Scenario: Set Ship Date to today
    Then visit Orders landing page
    Then sign-in to Orders
    Then Open Orders Settings General Settings
    Then set Orders Settings General postdate to now +2 hours
    Then close Orders Settings modal
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to PM Flat Rate Envelope
    Then click Orders Toolbar Print button
    Then expect Print modal Ship Date is 0 days from today
    Then select Print modal Ship Date datepicker to today
    Then select Print modal Ship Date datepicker to today plus 1
    Then select Print modal Ship Date datepicker to today plus 2
    Then select Print modal Ship Date datepicker to today
    Then expect Print modal Ship Date is 0 days from today
    Then close Print Modal
    Then Open Orders Settings General Settings
    Then set Orders Settings General postdate to 5:00 p.m.
    Then close Orders Settings modal
    Then Sign out

  @bvt_international_shipping
  Scenario: BVT International Shipping
    Then visit Orders landing page
    Then sign-in to Orders

    Then add new order
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set Order Details Ounces to 4
    Then set Order Details service to PMI Flat Rate Envelope
    Then click Order Details form Customs Form button
    Then add Customs Associated Item 1, Description random, Qty 1, Price 4, Made In Japan, Tariff 1
    Then set Customs Package Contents to Commercial Sample
    Then set Customs Package Contents to Gift
    Then set Customs Package Contents to Document
    Then set Customs Package Contents to Humanitarian Donation
    Then set Customs Package Contents to Merchandise
    Then set Customs Package Contents to Other
    Then set Customs More Info to random
    Then set Customs Non-Delivery Options to Return to sender
    Then set Customs Internal Transaction Number to Not required
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click Orders Toolbar Print button
    Then in Print modal, click Close button
    Then Sign out
