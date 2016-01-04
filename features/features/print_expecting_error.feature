Feature: Print Validation Errors

  Background:
    Given I am signed in to Orders

  @dpo_print_error
  Scenario: Two character minimum for Name & Company with DPO/APO address
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to
    | name  | company | street_address      | city  | state | zip        | country       | phone  |  email |
    | A     |         |Unit 8400, Box 0000  | DPO   | AE    | 09498-9997 | United States |        |        |
    Then Set Order Details Ounces to 1
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions to Checked
    Then Close Customs Form
    Then Print expecting error "First and Last Name, with two chars each or Full Name with two char First and Last Name or Company Name with two chars is required for both sender and recipient"



    Then Sign out