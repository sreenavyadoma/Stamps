
Feature: Local Rating Zone 1
  The automated tests should use the three from addresses in the "Zones" tab to test each of the 9 postal zones for accuracy.
  Ratesets CBP, CPP and the most common of the SAS rates should be tested.

  Background:
    Given I am signed in as a batch shipper gc/qacc/auto15/password1

    @local_rating_zone_1
  Scenario Outline:  As a batch shipper, I want to be able to change my print media
    And I Add a new order
    Then Set single-order form Ship-From to <ship_from>
    Then Set single-order form Ship-To address to <ship_to>
    Then Set single-order form Service to "<service>"
    Then Set single-order form Pounds to <weight_lbs>
    Then Set single-order form Ounces to <weight_oz>
    Then Set single-order form Length to <length>
    Then Set single-order form Height to <height>
    Then Set single-order form Width to <width>
    Then Expect single-order form Total to be $<total>

    Examples:
      | ship_from | ship_to                               | service               | weight_lbs  | weight_oz | length  | height  | width   | total   |
      | default   | 1339 W Willow St, Long Beach, CA 90810| Priority Mail Package | 1           | 0         | 1       | 1       | 1       | 5.05    |
      | default   | 1339 W Willow St, Long Beach, CA 90810| Priority Mail Package | 2           | 0         | 1       | 0       | 0       | 5.05    |





