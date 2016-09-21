
Feature: BVT Purchasing

  Background:
    Given I am signed in to Orders

  @orders_bvt_purchasing
  Scenario: Purchasing $10
    Then Buy Mail: Purchase 10
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10
    Then Sign out

