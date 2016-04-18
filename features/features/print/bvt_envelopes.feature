Feature: Envelopes BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_envelopes
  Scenario: Envelope
    Then Postage: Select Envelope - #10
    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to Random Address in Zone 1
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Envelopes: Set Service to "First-Class Mail Letter"
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_bvt_envelopes2
  Scenario: Envelope
    Then Postage: Select Envelope - #10
    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name   | company | street_address      | city          | state | zip        | country       |
      | random | random  | 1350 Market Street  | San Francisco | CA    | 94102      | United States |

    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Envelopes: Set Service to "First-Class Mail Letter"
    Then Postage Envelopes: Set Include Return Address to Checked
    Then Postage Envelopes: Set Include Delivery Address to Unchecked
    Then Postage Envelopes: Set Include Postage to Unchecked
    Then Postage Envelopes: Set Reference Number to 43223
    Then Postage Envelopes: Set Cost Code to None
    Then Postage Print Modal: Print
    Then Sign out