
Feature: Mail Balance

  @nav_postage_balance_update
  Scenario: Update Mail Balance After Each Print
    Given a valid user is signed in to Web Apps
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Pounds to 1
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Tracking to USPS Tracking
    Then Pause for 1 second
    Then Save Order Details data
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button
    Then Pause for 3 seconds
    Then NavBar: Expect Customer Balance is deducted the Printing Cost
    Then Sign out
