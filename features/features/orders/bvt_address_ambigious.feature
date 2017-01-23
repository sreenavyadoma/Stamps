Feature:  Ambigious Address

  Background:
    Given I am signed in to Orders

  @bvt_ambigious_address
  Scenario: Ambigious Address
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to ambiguous address
      | name            | company  | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Betfair  | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect "Exact Address Not Found" module to appear
    Then Select row 2 from Exact Address Not Found module
    Then Order Details: Select Service PM Package
    Then Orders Grid: Check row 1
    Then Orders Grid: Expect Recipient is Joseph Balancio
    Then Orders Grid: Expect Company is Betfair
    Then Orders Grid: Expect City is San Francisco
    Then Orders Grid: Expect State is CA
    Then Orders Grid: Expect Zip is 94102
    Then Sign out
