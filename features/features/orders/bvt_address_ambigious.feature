@bvt
Feature:  Ambigious Address

  Background:
    Given I am signed in to Orders

  @bvt_ambigious_address
  Scenario: Ambigious Address
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to ambiguous address
      | name            | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Company Name  | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect "Exact Address Not Found" module to appear
    Then Select row 2 from Exact Address Not Found module
    Then Order Details: Set Service to "Priority Mail Package"
    Then Orders Grid: Check row 1
    Then Orders Grid: Expect Recipient to be Joseph Balancio
    Then Orders Grid: Expect Company to be Company Name
    Then Orders Grid: Expect City to be San Francisco
    Then Orders Grid: Expect State to be CA
    Then Orders Grid: Expect Zip to be 94102
    Then Sign out
