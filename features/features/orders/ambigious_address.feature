@regression
Feature: Ambigious Address

  Background:
    Given I am signed in to Orders

  @ambigious_address
  Scenario: Exact Address Not Found
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then Expect "Exact Address Not Found" module to appear
    Then Select row 1 from Exact Address Not Found module
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Insure For to $200
    Then Orders Grid: Expect Recipient to be Hillary Clinton
    Then Orders Grid: Expect Company to be The White House
    Then Orders Grid: Expect City to be San Francisco
    Then Orders Grid: Expect State to be CA
    Then Orders Grid: Expect Zip to be 94102
    Then Order Details: Hide Ship-To fields
    Then Order Details: Set Service to "Priority Mail Package"
    Then Sign out

