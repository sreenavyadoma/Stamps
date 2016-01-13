Feature: Address Cleansing BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  Scenario: Address Cleansing

    Then Select Print Postage Print On <media>
    Then Set Print Postage Ship-From to <address>
    Then Set Print Postage Form Ship-To address to
      | name              | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Ambiguous Address | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Set Print Postage Form Service to <service>
    Then Expect Print Postage Form Ship-To address to be <address>
    And Sign out