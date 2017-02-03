
Feature: Reset Fields

  Background:
    Given a valid user is signed in to Web Apps

  @general_settings_reset_fields @general_settings_dev
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

    Then Reset Fields:  Check Stamps Amount
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Stamps Amount Checked

    Then Reset Fields:  Uncheck Stamps Amount
    Then Reset Fields:  Close
    Then In Settings modal, Save
    Then Open Settings Modal
    Then In Settings modal, Open Reset Fields Modal
    Then Reset Fields:  Expect Stamps Amount Unchecked

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

