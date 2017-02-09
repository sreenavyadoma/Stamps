Feature:  BVT Address Cleansing

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_address_cleansing
  Scenario: Address Cleansing
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address
      | name          | company      | street_address     | street_address_2| city          | state | zip | country       | phone          |  email           |
      | Euan Davidson | Betfair | 1350 Market Street |                 | San Francisco | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |

    Then on Order Details form, select service PM Package
    Then on Order Details form, set Ounces to 1
    Then on Order Details form, blur out
    Then Pause for 2 seconds
    Then in Orders Grid, expect Recipient is Euan Davidson
    Then in Orders Grid, expect Company is Betfair
    Then in Orders Grid, expect Address is 1350 Market Street
    Then in Orders Grid, expect City is San Francisco
    Then in Orders Grid, expect State is CA
    Then in Orders Grid, expect Zip is 94102
    Then Sign out



