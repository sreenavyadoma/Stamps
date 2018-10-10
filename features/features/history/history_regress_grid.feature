Feature:  Mail BVT

  Background:
    Given Start test driver

  @refresh_filter_grid_after_actions
  Scenario: WEBAPPS-11274 Refresh Filter Grid After Performing Actions to Prints
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 1
    Then select print form service PM Package
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to History
    Then expect today is selected on history filter panel
    Then check history grid row for saved tracking number
    Then sign out
