Feature: Ambigious Address

  Background:
    Given a valid user is signed in to Web Apps

  @ambigious_address
  Scenario: Exact Address Not Found
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo, CA
    Then set Order Details form Ship-To to ambiguous address
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then Expect Exact Address Not Found module to appear
    Then In Exact Address Not Found module, select row 1
    Then set Order Details form Ounces to 1
    Then set Order Details form Pounds to 1
    Then expect Orders Grid Recipient is Hillary Clinton
    Then expect Orders Grid Company is The White House
    Then expect Orders Grid City is San Francisco
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 94102
    Then set Order Details form service to PM Package
    Then Sign out

