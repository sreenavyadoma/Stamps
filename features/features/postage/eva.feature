Feature: Select All Print Ons and Services



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Select Print Media and Services

    Then Select Print Postage print media 8 ½” x 11” Paper
    Then Select Print Postage print media 4 ¼” x 6 ¾” Shipping Label

    Then Select Service First-Class Mail Large Envelope/Flat

    Then Set Print Postage Form Ship-From to <address>
    Then Set Print Postage Form Ship-To address to
      | name              | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Ambiguous Address | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Set Print Postage Form Service to <service>
    Then Expect Print Postage Form Ship-To address to be <address>
    And Sign out

    #todo Eva