
Feature: BVT Purchasing

  Background:
    Given I am signed in to Orders

  @bvt_purchasing
  Scenario: Purchasing $10
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 5 through 8
    Then Details: Select Service PM Package
    Then Details: Set Ounces to 1
    Then Details: Set Width to 1
    Then Details: Set Length to 1
    Then Details: Set Height to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Buy Mail: Purchase 10
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10
    Then Sign out

