Feature: Extra Services BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Extra Services

    Then Print Postage - Select Print On <media>
    Then Shipping Label: Set Print Postage Ship-From to <address>
    Then Shipping Label: Set Print Postage Form Ship-To country to <country>
    Then Shipping Label: Set Print Postage Form Ship-To address to <address>
    Then Shipping Label: Set Print Postage Form Ounces to <number>
    Then Shipping Label: Set Print Postage Form Pounds to <number>
    Then Shipping Label: Set Print Postage Form Service to <service>
    Then Shipping Label: Open Extra Services
    Then Extra Services: Set COD to <number>
    Then Extra Services: Click Save
    Then Footer - Print Postage
    Then Sign out
