Feature: WebReg
  Background:
    Given I launched default browser

  @pam_meter_limit_100k
  Scenario:
    Then PAM: Load PAM Page
    Then PAM: Load Customer Search Page
    Then WebReg: Load username and password from parameter file webreg_meter_limit_100k
    Then PAM Customer Search: Set username from parameter file
    Then PAM Customer Search: Set 5.2 or lower
    Then PAM Customer Search: Click Search button

    Then PAM Customer Profile: Click Change Meter Limit link
    Then PAM Change Meter Limit: Set New Meter Limit to $100000
    Then PAM Change Meter Limit: Set USPS approval to Checked
    Then PAM Change Meter Limit: Click Submit

    Then PAM Customer Profile: Click  AppCap Overrides link
    Then PAM AppCap Overrides: Set Internet Mail Printing to Always On
    Then PAM AppCap Overrides: Set Netstamps Printing to Always On
    Then PAM AppCap Overrides: Set Shipping Label Printing to Always On
    Then PAM AppCap Overrides: Set International Shipping to Always On
    Then PAM AppCap Overrides: Set Allow High Risk Countries to Always On
    Then PAM AppCap Overrides: Submit
    Then WebReg: Save username and password to parameter file pam_meter_limit_100k
    Then WebReg: Store username to data file pam_meter_limit_100k

