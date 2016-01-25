Feature: Stamps BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @netstamps
  Scenario: Stamps Specify Postage
    Then Print Postage - Select Print On Stamps
    Then Stamps: Set Stamps Serial Number to B12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Print Postage Ship-From to default
    Then Stamps: Set Print Postage Form Ship-To country to United States
    Then Stamps: Set Print Postage Form Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamps Stamp Amount to $4.65

    Then Footer - Print Postage
    And Sign out

  @wp_bvt
  Scenario: Stamps Calculate Postage
    Then Print Postage - Select Print Postage Print On Stamps
    Then Stamps: Set Serial Number to <number>
    Then Stamps: Select Calculate Postage Amount
    Then Stamps: Set Print Postage Form Ship-From to <address>
    Then Stamps: Set Print Postage Form Ship-To country to <country>
    Then Stamps: Set Print Postage Form Ounces to <number>
    Then Stamps: Set Print Postage Form Pounds to <number>
    Then Stamps: Set Print Postage Form Service to <service>
    Then Footer - Print Postage
    And Sign out

