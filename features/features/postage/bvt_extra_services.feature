Feature: Extra Services BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Extra Services

    Then Select Print Postage print media <media>
    Then Set Print Postage Form Ship-From to <address>
    Then Set Print Postage Form Ship-To country to <country>
    Then Set Print Postage Form Ship-To address to <address>
    Then Set Print Postage Form Ounces to <number>
    Then Set Print Postage Form Pounds to <number>
    Then Set Print Postage Form Service to <service>
    Then Open Extra Services
    Then Set Extra Services COD to <number>
    Then Save Extra Services
    Then Print Postage
    Then Sign out
