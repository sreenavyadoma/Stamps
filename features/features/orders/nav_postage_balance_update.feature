
Feature: Mail Balance

  @nav_postage_balance_update
  Scenario: Update Mail Balance After Each Print
    Given A user is signed in to Orders
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Insure-For to $10.00
    Then On Order Details form, set Tracking to USPS Tracking
    Then Pause for 1 second
    Then Save Test Data
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then Pause for 3 seconds
    Then NavBar: Expect Customer Balance is deducted the Printing Cost
    Then Sign out
