
Feature: Ship Date

  Background:
    Given a valid user is signed in to Web Apps

  @ship_date
  Scenario:  set print modal ship date to today
    Then add new order
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then click orders toolbar print button
    Then set print modal ship date to today
    Then In left Filter Panel, expect Shipped Tab Ship Date is today
    Then click print modal print button
    Then sign out


  @ship_date
  Scenario:  set print modal ship date to 1 day from today
    Then add new order
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then click orders toolbar print button
    Then set print modal ship date to today plus 1
    Then set print modal ship date to today plus 3
    Then click print modal print button
    Then sign out


  @ship_date
  Scenario:  set print modal ship date to 1 day from today
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then click orders toolbar print button
    Then set print modal ship date to today plus 2
    Then In left Filter Panel, expect Shipped Tab Ship Date is today plus 2
    Then click print modal print button
    Then sign out


  @ship_date
  Scenario:  set print modal ship date to 1 day from today
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then click orders toolbar print button
    Then set print modal ship date to today plus 3
    Then In left Filter Panel, expect Shipped Tab Ship Date is today plus 3
    Then click print modal print button
    Then sign out


