
Feature: PAM page
  Background:
    Given PAM: Load PAM Page
  @pam
  Scenario: PAM page
    Then PAM: Load Customer Search Page

    Then PAM Customer Search: Set username to m207hzh944o48f
    Then PAM Customer Search: Set 5.2 or lower
    Then PAM Customer Search: Click Search button

    Then PAM Customer Profile: Click Change Meter Limit link
    Then PAM Change Meter Limit: Set USPS approval to Checked
    Then PAM Change Meter Limit: Set New Meter Limit to $100000
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

    Then Orders: Visit Sign-in page
    Then Orders: Sign-in as new user random/pass111
    Then Pause for 2 seconds
    Then Toolbar: Add
    Then Pause for 1 second
    Then Open Settings Modal
    Then Settings:  Set Logoff to 2 hours
    Then Settings:  Save
    Then Pause for 1 second
    Then Sign out
    Then WebReg Profile: Send username to standard out
    Then Pause for 1 second