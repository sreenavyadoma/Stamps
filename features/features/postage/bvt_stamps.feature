Feature: Stamps BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @netstamps
  Scenario: Stamps Specify Postage
    Then Select Print Postage Print On Stamps
    Then Set Stamps Serial Number to B12345
    Then Select Stamps Specify Postage Amount
    Then Set Print Postage Ship-From to default
    Then Set Print Postage Form Ship-To country to United States
    Then Set Print Postage Form Service to "First Class Mail (1 - 3 Days)"
    Then Set Stamps Stamp Amount to $4.65
    Then Print Postage
    And Sign out

  @wp_bvt
  Scenario: Stamps Calculate Postage
    Then Select Print Postage Print On Envelope - #10, 4 ⅛” x 9 ½”
    Then Select Print Postage Print On Stamps
    Then Set Stamps Serial Number to <number>
    Then Select Stamps Calculate Postage Amount
    Then Set Print Postage Ship-From to <address>
    Then Set Print Postage Form Ship-To country to <country>
    Then Set Print Postage Form Ounces to <number>
    Then Set Print Postage Form Pounds to <number>
    #Then Set Print Postage Form Service to <service>
    Then Print Postage
    And Sign out

