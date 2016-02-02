Feature: Envelopes BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @envelopes
  Scenario: Envelope
    Then Print Postage: Select Print On Envelope - #10, 4 ⅛” x 9 ½”
    Then Envelopes: Set Ship-From to default
    Then Envelopes: Set Ship-To country to United States
    Then Envelopes: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 92201      | United States |

    Then Envelopes: Set Pounds to 0
    Then Envelopes: Set Ounces to 1
    Then Envelopes: Set Service to "First-Class Mail Envelope"
    Then Footer: Print Postage
    And Sign out