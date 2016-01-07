Feature: NetStamps BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @netstamps
  Scenario: NetStamps Specify Postage
    Then Select Print Postage print media Envelope - #10, 4 ⅛” x 9 ½”
    Then Select Print Postage print media Stamps



    Then Enter Serial Number B12345
    Then Select Specify Postage Amount
    Then Set Print Postage Form Ship-From to default
    Then Set Print Postage Form Ship-To country to United States
    Then Set Print Postage Form Service to "First Class Mail (1 - 3 Days)"
    Then Set Print Postage Form Stamp Amount to 4.65
    Then Print Postage
    And Sign out

  @wp_bvt
  Scenario: NetStamps Calculate Postage
    Then Select Print Postage print media Stamps
    Then Enter Serial Number <number>
    Then Select Calculate Postage Amount
    Then Set Print Postage Form Ship-From to <address>
    Then Set Print Postage Form Ship-To country to <country>
    Then Set Print Postage Form Ounces to <number>
    Then Set Print Postage Form Pounds to <number>
    Then Set Print Postage Form Service to <service>
    Then Print Postage
    And Sign out

