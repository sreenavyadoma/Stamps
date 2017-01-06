Feature:  Ambigious Address

  Background:
    Given I am signed in to Orders

  @bvt_ambigious_address
  Scenario: Ambigious Address
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to ambiguous address
      | name            | company  | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Betfair  | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect "Exact Address Not Found" module to appear
    Then Select row 2 from Exact Address Not Found module
    Then Details: Select Service PM Package
    Then Grid: Check row 1
    Then Grid: Expect Recipient is Joseph Balancio
    Then Grid: Expect Company is Betfair
    Then Grid: Expect City is San Francisco
    Then Grid: Expect State is CA
    Then Grid: Expect Zip is 94102
    Then Sign out
