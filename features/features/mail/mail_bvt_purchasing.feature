Feature: Purchasing BVT

  Background:
    Given I am signed in as Mail shipper

  @mail_bvt_purchasing
  Scenario: Purchasing $10

    Then Buy Mail: Purchase Other Amount 35
    Then Buy Mail: Click Purchase button
    Then Buy Mail Confirm Purchase: Click Purchase button
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $35

    Then Sign out



#    Then Buy Mail: Purchase 10
#    Then Buy Mail: Click Purchase button
#    Then Buy Mail Confirm Purchase: Click Purchase button
#    Then Buy Mail Purchase Approved: Click OK button
#    Then Buy Mail: Expect customer balance increased by $10
#
#    Then Buy Mail: Purchase 25
#    Then Buy Mail: Click Purchase button
#    Then Buy Mail Confirm Purchase: Click Purchase button
#    Then Buy Mail Purchase Approved: Click OK button
#    Then Buy Mail: Expect customer balance increased by $25
#
#    Then Buy Mail: Purchase 50
#    Then Buy Mail: Click Purchase button
#    Then Buy Mail Confirm Purchase: Click Purchase button
#    Then Buy Mail Purchase Approved: Click OK button
#    Then Buy Mail: Expect customer balance increased by $50
#
#    Then Buy Mail: Purchase 100
#    Then Buy Mail: Click Purchase button
#    Then Buy Mail Confirm Purchase: Click Purchase button
#    Then Buy Mail Purchase Approved: Click OK button
#    Then Buy Mail: Expect customer balance increased by $100
