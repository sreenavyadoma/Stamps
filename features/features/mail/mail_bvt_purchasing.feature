Feature: Purchasing BVT

  Background:
    Given I am signed in as Mail shipper

  @mail_bvt_purchasing
  Scenario: Purchasing $10

    Then on Add Funds modal, purchase Other Amount 35
    Then on Add Funds modal, click Purchase button
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $35

    Then Sign out



#    Then on Add Funds modal, purchase 10
#    Then on Add Funds modal, click Purchase button
#    Then Buy Mail Confirm Transction: Click Confirm button
#    Then Buy Mail Purchase Approved: Click OK button
#    Then Buy Mail: Expect customer balance increased by $10
#
#    Then on Add Funds modal, purchase 25
#    Then on Add Funds modal, click Purchase button
#    Then Buy Mail Confirm Transction: Click Confirm button
#    Then Buy Mail Purchase Approved: Click OK button
#    Then Buy Mail: Expect customer balance increased by $25
#
#    Then on Add Funds modal, purchase 50
#    Then on Add Funds modal, click Purchase button
#    Then Buy Mail Confirm Transction: Click Confirm button
#    Then Buy Mail Purchase Approved: Click OK button
#    Then Buy Mail: Expect customer balance increased by $50
#
#    Then on Add Funds modal, purchase 100
#    Then on Add Funds modal, click Purchase button
#    Then Buy Mail Confirm Transction: Click Confirm button
#    Then Buy Mail Purchase Approved: Click OK button
#    Then Buy Mail: Expect customer balance increased by $100
