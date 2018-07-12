
Feature: Mail Balance

  @nav_postage_balance_update
  Scenario: Update Mail Balance After Each Print
    Given a valid user is signed in to Web Apps
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details service to PM Package
    Then set order details tracking to USPS Tracking
    Then pause for 1 second
    Then Save Order Details data
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button
    Then pause for 3 seconds
    Then NavBar: Expect Customer Balance is deducted the Printing Cost
    Then sign out
