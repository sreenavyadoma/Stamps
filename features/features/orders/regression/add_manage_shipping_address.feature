
Feature: Add Manage Shipping Addresses

  Background:
    Given a valid user is signed in to Web Apps

  @add_manage_shipping_address
  Scenario: Add Manage Shipping Addresses

    Then add new order
    #
    Then Add random Ship-from address from zone 1
    Then Add random Ship-from address from zone 2
    Then Add random Ship-from address from zone 3
    #address 1
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          |   Euan    | Betfair | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5557  |
    #address 2
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |     city      | state       | zip    | country       | phone           |
      |90245          |   Kevin   | Int UK  | 201 Mission Street | Suite 701       |    Fremont    | California  | 94538  | United States | (415) 123-5559  |
    #address 3
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |     city       | state      | zip    | country       | phone           |
      |90245          |  SMITH    | Ahold   | 301 Mission Street | Suite 700       | San Bernardino | California | 28376  | United States | (415) 123-5500  |
    #address 4
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |    city      | state        | zip    | country       | phone           |
      |90245          | JOHNSON   | Akai    | 101 Mission Street | Suite 700       |    Orange    | California   | 22015  | United States | (415) 123-5503  |
    #address 5
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |     city      | state       | zip    | country       | phone           |
      |90245          | MILLER    | Akzo    | 101 Mission Street | Suite 700       |   Los Angeles | California  | 06614  | United States | (415) 123-5505  |
    #address 6
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |    city      |  state       | zip    | country       | phone           |
      |90245          | BROWN     | AMD     | 101 Mission Street | Suite 700       |    San Mateo | California   | 98503  | United States | (415) 123-5507  |
      #address 7
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |  city    |   state       |  zip    |  country       |   phone          |
      |90245          | WILLIAMS  | Amoco   | 101 Mission Street | Suite 700       |  Napa    |  California   |  11722  |  United States |   (415) 123-5509 |
      #address 8
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |   city      |   state     |  zip    |  country       |  phone          |
      |90245          | ANDERSON  | Arcor   | 101 Mission Street | Suite 700       |   San Diego |  California |  10562  |  United States |  (415) 123-5511 |
      #address 9
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |   city       |  state       | zip    | country       | phone           |
      |90245          | MARTIN    | BASF    | 101 Mission Street | Suite 700       |   Sacramento | California   | 99504  | United States | (415) 123-5513  |
      #address 10
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name | company | street_address     | street_address2 |   city   |   state       |  zip    |  country       |  phone           |
      |90245          | CLARK     | Buick   | 101 Mission Street | Suite 700       |   Fresno |  California   |  93706  |  United States |  (415) 123-5518  |

    Then Sign out