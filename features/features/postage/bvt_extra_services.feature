Feature: Extra Services BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Extra Services

    Then Print Postage: Select Print On <media>
    Then Shipping Labels: Set Ship-From to <address>
    Then Shipping Labels: Set Ship-To country to <country>
    Then Shipping Labels: Set Ship-To address to "address"
    Then Shipping Labels: Set Ounces to <number>
    Then Shipping Labels: Set Pounds to <number>
    Then Shipping Labels: Set Service to "service"
    Then Shipping Labels: Open Extra Services
    Then Extra Services: Set COD to <number>
    Then Extra Services: Click Save
    Then Footer: Print Postage
    Then Sign out

