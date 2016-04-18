Feature: Stamps BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_netstamps_specify

  Scenario: Stamps Specify Postage
    Then Postage: Select Stamps

    Then Postage Stamps: Set Serial Number to random

    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Set Specify Postage Service to "Media Mail (2 - 3 Days)"
    Then Postage Stamps: Set Stamp Amount to $4.65
    Then Postage Stamps: Set Quantity to 3
    Then Postage Stamps: Set Reference Number to Stamp3221
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_bvt
  @wp_bvt_netstamps_calculate
  Scenario: Stamps Calculate Postage
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to random
    Then Postage Stamps: Select Calculate Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Set Weight 0 lbs 1 oz
    Then Postage Stamps: Set Calculate Postage Service to "First-Class Mail Large Envelope/Flat"
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

