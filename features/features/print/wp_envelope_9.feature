Feature: Envelope #9

  Background:
    Given I am signed in as a postage shipper

  @wp_envelope_regression
  @wp_envelope_9
  Scenario: Envelope #9
    Then Print Postage: Select Envelope - #9
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Print Postage
    Then Sign out