Feature: Envelopes BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @envelopes
  Scenario: Envelope
    Then Print Postage - Select Print On Envelope - #10, 4 ⅛” x 9 ½”
    Then Envelopes: Set Print Postage Ship-From to default
    Then Envelopes: Set Print Postage Form Ship-To country to United States
    Then Envelopes: Set Print Postage Form Ship-To address to
      | name          | company       | street_address      | city          | state | zip        | country       |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    | 92201      | United States |

    Then Envelopes: Set Print Postage Form Ounces to 0
    Then Envelopes: Set Print Postage Form Pounds to 1
    Then Envelopes: Set Print Postage Form Service to "service"
    Then Footer - Print Postage
    And Sign out