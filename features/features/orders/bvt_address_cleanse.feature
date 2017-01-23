Feature:  BVT Address Cleansing

  Background:
    Given I am signed in to Orders

  @bvt_address_cleansing
  Scenario: Address Cleansing
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name          | company      | street_address     | street_address_2| city          | state | zip | country       | phone          |  email           |
      | Euan Davidson | Betfair | 1350 Market Street |                 | San Francisco | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |

    Then Order Details: Select Service PM Package
    Then Order Details: Set Ounces to 1
    Then Order Details: Blur out
    Then Pause for 2 seconds
    Then Orders Grid: Expect Recipient is Euan Davidson
    Then Orders Grid: Expect Company is Betfair
    Then Orders Grid: Expect Address is 1350 Market Street
    Then Orders Grid: Expect City is San Francisco
    Then Orders Grid: Expect State is CA
    Then Orders Grid: Expect Zip is 94102
    Then Sign out



