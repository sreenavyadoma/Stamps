Feature:  BVT Address Cleansing

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_address_cleansing
  Scenario: Address Cleansing
    Then add new order
    Then set Order Details form Ship-To Domestic address to
      | full_name     | company | street_address     | street_address_2| city          | state | zip | country       | phone          |  email           |
      | Euan Davidson | Betfair | 1350 Market Street |                 | San Francisco | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then blur out on Order Details form
    Then Pause for 2 seconds
    Then expect Orders Grid Recipient is Euan Davidson
    Then expect Orders Grid Company is Betfair
    Then expect Orders Grid Address is 1350 Market Street
    Then expect Orders Grid City is San Francisco
    Then expect Orders Grid State is CA
    Then expect Orders Grid Zip is 94102
    Then Sign out



