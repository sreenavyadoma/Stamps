Feature:  Ambigious Address

  Background:
    Given A user is signed in to Orders

  @bvt_ambigious_address
  Scenario: Ambigious Address
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to ambiguous address
      | name            | company  | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Betfair  | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect Exact Address Not Found module to appear
    Then In Exact Address Not Found module, select row 2
    Then On Order Details form, select service PM Package
    Then In Orders Grid, check row 1
    Then In Orders Grid, expect Recipient is Joseph Balancio
    Then In Orders Grid, expect Company is Betfair
    Then In Orders Grid, expect City is San Francisco
    Then In Orders Grid, expect State is CA
    Then In Orders Grid, expect Zip is 94102
    Then Sign out
