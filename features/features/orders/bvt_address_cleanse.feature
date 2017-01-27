Feature:  BVT Address Cleansing

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_address_cleansing
  Scenario: Address Cleansing
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address
      | name          | company      | street_address     | street_address_2| city          | state | zip | country       | phone          |  email           |
      | Euan Davidson | Betfair | 1350 Market Street |                 | San Francisco | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |

    Then On Order Details form, select service PM Package
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, Blur out
    Then Pause for 2 seconds
    Then In Orders Grid, expect Recipient is Euan Davidson
    Then In Orders Grid, expect Company is Betfair
    Then In Orders Grid, expect Address is 1350 Market Street
    Then In Orders Grid, expect City is San Francisco
    Then In Orders Grid, expect State is CA
    Then In Orders Grid, expect Zip is 94102
    Then Sign out



