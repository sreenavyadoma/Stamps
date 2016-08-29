
Feature: Purchasing

  Background:
    Given I am signed in to Orders

  @purchasing
  Scenario:
    Then Buy Postage: Purchase 10
    Then Buy Postage: Click Purchase button
    Then Buy Postage Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Postage Confirm Purchase: Click Purchase button
    Then Buy Postage Purchase Approved: Expect text area contains, Your postage purchase request for $10.00 has been approved.
    Then Buy Postage Purchase Approved: Click OK button
    Then Buy Postage: Click Purchase button
    Then Buy Postage: Expect customer balance increased by $10

    Then Buy Postage: Purchase 25
    Then Buy Postage: Click Purchase button
    Then Buy Postage Confirm Purchase: Expect text area contains, Please confirm your $25.00 postage purchase.
    Then Buy Postage Confirm Purchase: Click Purchase button
    Then Buy Postage Purchase Approved: Expect text area contains, Your postage purchase request for $25.00 has been approved.
    Then Buy Postage Purchase Approved: Click OK button
    Then Buy Postage: Click Purchase button
    Then Buy Postage: Expect customer balance increased by $25

    Then Buy Postage: Purchase 50
    Then Buy Postage: Click Purchase button
    Then Buy Postage Confirm Purchase: Expect text area contains, Please confirm your $50.00 postage purchase.
    Then Buy Postage Confirm Purchase: Click Purchase button
    Then Buy Postage Purchase Approved: Expect text area contains, Your postage purchase request for $50.00 has been approved.
    Then Buy Postage Purchase Approved: Click OK button
    Then Buy Postage: Click Purchase button
    Then Buy Postage: Expect customer balance increased by $50

    Then Buy Postage: Purchase 100
    Then Buy Postage: Click Purchase button
    Then Buy Postage Confirm Purchase: Expect text area contains, Please confirm your $100.00 postage purchase.
    Then Buy Postage Confirm Purchase: Click Purchase button
    Then Buy Postage Purchase Approved: Expect text area contains, Your postage purchase request for $100.00 has been approved.
    Then Buy Postage Purchase Approved: Click OK button
    Then Buy Postage: Click Purchase button
    Then Buy Postage: Expect customer balance increased by $100

    Then Buy Postage: Purchase Other Amount 35
    Then Buy Postage: Click Purchase button
    Then Buy Postage Confirm Purchase: Expect text area contains, Please confirm your $35.00 postage purchase.
    Then Buy Postage Confirm Purchase: Click Purchase button
    Then Buy Postage Purchase Approved: Expect text area contains, Your postage purchase request for $35.00 has been approved.
    Then Buy Postage Purchase Approved: Click OK button
    Then Buy Postage: Click Purchase button
    Then Buy Postage: Expect customer balance increased by $35
    Then Sign out
