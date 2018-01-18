
Feature: Mail Balance

  @nav_postage_balance_update
  Scenario: Update Mail Balance After Each Print
    Given a valid user is signed in to Web Apps
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Pounds to 1
    Then set Order Details service to PM Package
    Then set Order Details Tracking to USPS Tracking
    Then Pause for 1 second
    Then Save Order Details data
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then Pause for 3 seconds
    Then NavBar: Expect Customer Balance is deducted the Printing Cost
    Then Sign out
