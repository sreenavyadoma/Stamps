
Feature: PAM page
  Background:
    Given I launched default browser

  @webreg_pam
  Scenario: PAM page
    Then PAM: Load PAM Page
    Then PAM: Load Customer Search Page
    Then WebReg: Load username and password from parameter file
    Then PAM Customer Search: Set username from parameter file
    Then PAM Customer Search: Set 5.2 or lower
    Then PAM Customer Search: Click Search button

    Then PAM Customer Profile: Click Change Meter Limit link
    Then PAM Change Meter Limit: Set New Meter Limit to $100000
    Then PAM Change Meter Limit: Set USPS approval to Checked
    Then PAM Change Meter Limit: Click Submit

    Then PAM Customer Profile: Click ACH Credit link
    Then PAM ACH Purchase: Set Amount to $100000.00

    Then PAM Customer Profile: Click  AppCap Overrides link
    Then PAM AppCap Overrides: Set Internet Mail Printing to Always On
    Then PAM AppCap Overrides: Set Netstamps Printing to Always On
    Then PAM AppCap Overrides: Set Shipping Label Printing to Always On
    Then PAM AppCap Overrides: Set International Shipping to Always On
    Then PAM AppCap Overrides: Set Allow High Risk Countries to Always On
    Then PAM AppCap Overrides: Submit
    Then WebReg: Store username to data file webreg_pam
    Then Pause for 4 seconds


