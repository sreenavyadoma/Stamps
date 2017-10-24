
Feature: Mail Balance

  @nav_postage_balance_update
  Scenario: Update Mail Balance After Each Print
    Given a valid user is signed in to Web Apps
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Pounds to 1
    Then set Order Details form service to PM Package
    Then set Order Details form Tracking to USPS Tracking
    Then Pause for 1 second
    Then Save Order Details data
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then Pause for 3 seconds
    Then NavBar: Expect Customer Balance is deducted the Printing Cost
    Then Sign out
