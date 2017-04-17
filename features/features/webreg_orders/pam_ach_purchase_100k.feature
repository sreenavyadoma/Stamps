Feature: WebReg
  Background:
    Given I launched default browser

  @pam_ach_purchase_100k
  Scenario:
    Then PAM: Load PAM Page
    Then Visit PAM Customer Search page
    Then WebReg: Load username and password from parameter file webreg_ach_purchase_100k
    Then set PAM Customer Search page username from parameter file
    Then set PAM Customer Search page 5.2 or lower
    Then On PAM Customer Search page, click Search button

    Then On PAM Customer Profile page, click Change Meter Limit link
    Then On PAM Change Meter Limit page, set New Meter Limit to $100000
    Then On PAM Change Meter Limit page, set USPS approval to Checked
    Then On PAM Change Meter Limit page, click Submit

    Then On PAM Customer Profile page, click ACH Credit link
    Then On PAM ACH Purchase page, set Amount to $100000.00

    Then On PAM Customer Profile page, click  AppCap Overrides link
    Then On PAM AppCap Overrides page, set Internet Mail Printing to Always On
    Then On PAM AppCap Overrides page, set Netstamps Printing to Always On
    Then On PAM AppCap Overrides page, set Shipping Label Printing to Always On
    Then On PAM AppCap Overrides page, set International Shipping to Always On
    Then On PAM AppCap Overrides page, set Allow High Risk Countries to Always On
    Then On PAM AppCap Overrides page, Submit
    Then WebReg: Save username and password to parameter file pam_ach_purchase_100k
    Then WebReg: Store username to data file pam_ach_purchase_100k

