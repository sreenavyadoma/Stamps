
Feature: BVT Purchasing

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_purchasing
  Scenario: Purchasing $10
    Then Buy Mail: Purchase 10
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your fund request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10
    Then Sign out

