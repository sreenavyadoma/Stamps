Feature: Envelope #9

  Background:
    Given I am signed in as a postage shipper

  @wp_envelope_regression
  @wp_envelope_9
  Scenario: Envelope #9
    Then Postage: Select Envelope - #9
    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Envelopes: Set Service to "First-Class Mail Letter"
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out