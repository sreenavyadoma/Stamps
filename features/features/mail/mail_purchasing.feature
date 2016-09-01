
Feature: Purchasing

  Background:
    Given I am signed in as Mail shipper

  @purchasing
  Scenario:
    Then Buy Mail: Purchase 10
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10

    Then Buy Mail: Purchase 25
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $25.00 postage purchase.
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $25.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $25

    Then Buy Mail: Purchase 50
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $50.00 postage purchase.
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $50.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $50

    Then Buy Mail: Purchase 100
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $100.00 postage purchase.
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $100.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $100

    Then Buy Mail: Purchase Other Amount 35
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $35.00 postage purchase.
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $35.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $35
    Then Sign out
