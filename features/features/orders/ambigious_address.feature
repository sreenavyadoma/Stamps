Feature: Ambigious Address

  Background:
    Given a valid user is signed in to Web Apps

  @ambigious_address
  Scenario: Exact Address Not Found
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to ambiguous address
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then Expect Exact Address Not Found module to appear
    Then In Exact Address Not Found module, select row 1
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, set Pounds to 1
    Then expect Orders Grid Recipient is Hillary Clinton
    Then expect Orders Grid Company is The White House
    Then expect Orders Grid City is San Francisco
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 94102
    Then on Order Details form, select service PM Package
    Then Sign out

