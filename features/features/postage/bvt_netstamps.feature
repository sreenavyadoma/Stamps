Feature: NetStamps BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: NetStamps Specify Postage
    Then Select Print Postage print media Stamps
    Then Enter Serial Number B12345
    Then Select Specify Postage Amount
    Then Set Print Postage Form Ship-From to default
    Then Set Print Postage Form Ship-To country to Afghanistan
    Then Set Print Postage Form Service to <service>
    Then Set Print Postage Form Stamp Amount to <number>
    Then Print Postage
    And Sign out

  @wp_bvt
  Scenario: NetStamps Calculate Postage
    Then Select Print Postage print media <media>
    Then Enter Serial Number <number>
    Then Select Calculate Postage Amount
    Then Set Print Postage Form Ship-From to <address>
    Then Set Print Postage Form Ship-To country to <country>
    Then Set Print Postage Form Ounces to <number>
    Then Set Print Postage Form Pounds to <number>
    Then Set Print Postage Form Service to <service>
    Then Print Postage
    And Sign out

