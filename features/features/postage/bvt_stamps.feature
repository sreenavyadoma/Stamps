Feature: Stamps BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_netstamps_specify

  Scenario: Stamps Specify Postage
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to B12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "Media Mail (2 - 3 Days)"
    Then Stamps: Set Stamp Amount to $4.65
    Then Footer: Print Postage
    And Sign out

  @wp_bvt
  @wp_bvt_netstamps_calculate
  Scenario: Stamps Calculate Postage
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to B54321
    Then Stamps: Select Calculate Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Weight 0 lbs 1 oz
    Then Stamps: Set Calculate Postage Service to "First-Class Mail Large Envelope/Flat"
    Then Footer: Print Postage
    And Sign out

