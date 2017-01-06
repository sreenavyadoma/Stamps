Feature:  BVT Address Cleansing

  Background:
    Given I am signed in to Orders

  @bvt_address_cleansing
  Scenario: Address Cleansing
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address
      | name          | company      | street_address     | street_address_2| city          | state | zip | country       | phone          |  email           |
      | Euan Davidson | Betfair | 1350 Market Street |                 | San Francisco | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |

    Then Details: Select Service PM Package
    Then Details: Set Ounces to 1
    Then Details: Blur out
    Then Pause for 2 seconds
    Then Grid: Expect Recipient is Euan Davidson
    Then Grid: Expect Company is Betfair
    Then Grid: Expect Address is 1350 Market Street
    Then Grid: Expect City is San Francisco
    Then Grid: Expect State is CA
    Then Grid: Expect Zip is 94102
    Then Sign out



