Feature:  Ambigious Address

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_ambigious_address
  Scenario: Ambigious Address
    Then add new order
    Then set Order Details form Ship-To to ambiguous address
      | full_name       | company  | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Betfair  | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect Exact Address Not Found module to appear
    Then In Exact Address Not Found module, select row 2
    Then set Order Details form service to PM Package
    Then Pause for 2 seconds
    Then expect Orders Grid Recipient is Joseph Balancio
    Then expect Orders Grid Company is Betfair
    Then expect Orders Grid City is San Francisco
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 94102
    Then Sign out
