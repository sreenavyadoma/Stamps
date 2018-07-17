Feature: Ambigious Address

  Background:
    Given a valid user is signed in to Web Apps

  @ambigious_address
  Scenario: Exact Address Not Found
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to ambiguous address to
      | full_name       | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then expect exact address not found window title is Exact Address Not Found
    Then select exact address not found row 1
    Then set order details ounces to 1
    Then set order details pounds to 1
    #Then expect orders grid recipient is Hillary Clinton
    #Then expect orders grid company is The White House
    #Then expect orders grid city is San Francisco
    #Then expect orders grid state is CA
    #Then expect orders grid zip is 94102
    Then set order details service to PM Package
    Then sign out

