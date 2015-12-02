Feature: Envelopes BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Envelope
    Then Select Print Postage print media <media>
    Then Set Print Postage Form Ship-From to <address>
    Then Set Print Postage Form Ship-To country to <country>
    Then Set Print Postage Form Ship-To address to <address>
    Then Set Print Postage Form Ounces to <number>
    Then Set Print Postage Form Pounds to <number>
    Then Set Print Postage Form Service to <service>
    Then Print Postage
    And Sign out