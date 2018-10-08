Feature:  History regression

  Background:
    Given Start test driver

  @container_label_reprint
  Scenario: Container label reprint for Shipping label 8x11 paper
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

    Then click container label on history filter panel
    Then select row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on create container label
    Then expect container label modal on history is present
    Then expect number of container on container label modal is 1
    Then click print label button on container label modal
    Then click printing on drop down on ready to print modal
    Then expect Shipping Label - 8 ½" x 11" Paper is present on printing on
    Then expect Shipping Label - SDC-1200, 4 ¼" x 6 ¾" Paper is present on printing on
    Then expect Shipping Label - 5 ½" x 8 ½" is present on printing on
    Then expect Roll - 4" x 6" Shipping Label is not present on printing on;
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is not present on printing on
    Then click printing on drop down on ready to print modal
    Then select Shipping Label - 8 ½" x 11" Paper on printing on
    Then expect total cost on ready to print modal is 0
    Then select printer factory on ready to print modal
    Then click print button on ready to print modal
    Then sign out