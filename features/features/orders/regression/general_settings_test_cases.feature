
@general_settings_test_cases
Feature: General Settings Positive and Negative Test-cases

  Background:
    Given a valid user is signed in to Web Apps

  @general_settings_logoff
  Scenario: Show unavailable services

    Then open Settings Modal
    Then in Orders Settings, click on General Settings tab

    Then In Settings modal, set Logoff to 5 min.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 5 min.

    Then In Settings modal, set Logoff to 10 min.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 10 min.

    Then In Settings modal, set Logoff to 15 min.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 15 min.

    Then In Settings modal, set Logoff to 30 min.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 30 min.

    Then In Settings modal, set Logoff to 1 hour.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 1 hour

    Then In Settings modal, set Logoff to 2 hours
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Logoff is set for 2 hours

    Then In Settings modal, Close

    Then Sign out


  @general_settings_postage_balance
  Scenario: Mail Balance

    Then Open Settings Modal

    Then In Settings modal, set Mail Balance to 0
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 0

    Then In Settings modal, set Mail Balance to 10
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 10

    Then In Settings modal, set Mail Balance to 25
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 25

    Then In Settings modal, set Mail Balance to 50
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 50

    Then In Settings modal, set Mail Balance to 100
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 100

    Then In Settings modal, set Mail Balance to 250
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 250

    Then In Settings modal, set Mail Balance to 500
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 500

    Then In Settings modal, set Mail Balance to 0
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 0

    Then In Settings modal, set Mail Balance to 0
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Mail Balance set to 0

    Then In Settings modal, Close

    Then Sign out


  @general_settings_postdate
  Scenario: Postdate

    Then Open Settings Modal

    Then in Settings modal, set Postdate to 12:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 12:00 a.m.

    Then In Settings modal, set Postdate to 1:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 1:00 a.m.

    Then In Settings modal, set Postdate to 2:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 2:00 a.m.

    Then In Settings modal, set Postdate to 3:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 3:00 a.m.

    Then In Settings modal, set Postdate to 4:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 4:00 a.m.

    Then In Settings modal, set Postdate to 5:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 5:00 a.m.

    Then In Settings modal, set Postdate to 6:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 6:00 a.m.

    Then In Settings modal, set Postdate to 7:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 7:00 a.m.

    Then In Settings modal, set Postdate to 8:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 8:00 a.m.

    Then In Settings modal, set Postdate to 9:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 9:00 a.m.

    Then In Settings modal, set Postdate to 10:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 10:00 a.m.

    Then In Settings modal, set Postdate to 11:00 a.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 11:00 a.m.

    Then In Settings modal, set Postdate to 12:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 12:00 p.m.

    Then In Settings modal, set Postdate to 1:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 1:00 p.m.

    Then In Settings modal, set Postdate to 2:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 2:00 p.m.

    Then In Settings modal, set Postdate to 3:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 3:00 p.m.

    Then In Settings modal, set Postdate to 4:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 4:00 p.m.

    Then In Settings modal, set Postdate to 5:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 5:00 p.m.

    Then In Settings modal, set Postdate to 6:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 6:00 p.m.

    Then In Settings modal, set Postdate to 7:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 7:00 p.m.

    Then In Settings modal, set Postdate to 8:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 8:00 p.m.

    Then In Settings modal, set Postdate to 9:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 9:00 p.m.

    Then In Settings modal, set Postdate to 10:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 10:00 p.m.

    Then In Settings modal, set Postdate to 11:00 p.m.
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Postdate set to 11:00 p.m.

    Then In Settings modal, Close

    Then Sign out


  @general_settings_reset_fields
  Scenario: Reset Fields

    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal

    Then Reset Fields:  Set Weight to 1 lb 1 oz
    Then Pause for 3 seconds
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Weight lb equals 1
    Then Reset Fields:  Expect Weight oz equals 1

    Then Reset Fields:  Set Dimensions to length 1, width 1, height 1
    Then Pause for 3 seconds
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Dimensions to length equals 1
    Then Reset Fields:  Expect Dimensions to width equals 1
    Then Reset Fields:  Expect Dimensions to height equals 1

    Then Reset Fields:  Check Service
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect service Checked

    Then Reset Fields:  Uncheck Service
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect service Unchecked

    Then Reset Fields:  Check Weight
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Weight Checked

    Then Reset Fields:  Uncheck Weight
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Weight Unchecked

    Then Reset Fields:  Check Dimensions
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Dimensions Checked

    Then Reset Fields:  Uncheck Dimensions
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Dimensions Unchecked

    Then Reset Fields:  Check Ship to Address
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Ship to Address Checked

    Then Reset Fields:  Uncheck Ship to Address
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Ship to Address Unchecked

    Then Reset Fields:  Check Tracking
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Tracking Checked

    Then Reset Fields:  Uncheck Tracking
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Tracking Unchecked

    Then Reset Fields:  Check Extra Services
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Extra Services Checked

    Then Reset Fields:  Uncheck Extra Services
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Extra Services Unchecked

    Then Reset Fields:  Check Insurance
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Insurance Checked

    Then Reset Fields:  Uncheck Insurance
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Insurance Unchecked

    Then Reset Fields:  Check Reference Numbers
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Reference Numbers Checked

    Then Reset Fields:  Uncheck Reference Numbers
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Reference Numbers Unchecked

    Then Reset Fields:  Check Cost Code
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Cost Code Checked

    Then Reset Fields:  Uncheck Cost Code
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Cost Code Unchecked

    Then Reset Fields:  Check Customs
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Customs Checked

    Then Reset Fields:  Uncheck Customs
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Customs Unchecked

    Then Reset Fields:  Check Quantity
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Quantity Checked

    Then Reset Fields:  Uncheck Quantity
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Quantity Unchecked

    Then Reset Fields:  Check Print form Amount
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Print form Amount Checked

    Then Reset Fields:  Uncheck Print form Amount
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Print form Amount Unchecked

    Then Reset Fields:  Check Auto-Advance Label Position
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Auto-Advance Label Position Checked
    Then Reset Fields:  Uncheck Auto-Advance Label Position
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Auto-Advance Label Position Unchecked

    Then Reset Fields:  Close

    Then In Settings modal, Save

    Then Sign out


  @general_settings_services
  Scenario: Services, Print Confirm, USPS Terms, Contacts and Shipments

    Then Open Settings Modal
    Then Settings: Check Services
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Services Checked

    Then In Settings modal, Uncheck Services
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Services Unchecked

    Then Settings: Check Print Confirm
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Print Confirm Checked

    Then Settings: Uncheck Print Confirm
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Print Confirm Unchecked

    Then Settings: Check USPS Terms
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect USPS Terms Checked

    Then Settings: Uncheck USPS Terms
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect USPS Terms Unchecked

    Then Settings: Check Contacts
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Contacts Checked

    Then Settings: Uncheck Contacts
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Contacts Unchecked

    Then Settings: Check Shipments
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Shipments Checked

    Then Settings: Uncheck Shipments
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Expect Shipments Unchecked

    Then In Settings modal, Close

    Then Sign out


