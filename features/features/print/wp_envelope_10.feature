Feature: Envelope #10



  Background:
    Given I am signed in as a postage shipper

  @wp_envelope_regression
  @wp_envelope_10
  Scenario: Envelope #10
    Then Print Postage: Select Envelope - #10
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Print Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Letter"
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out