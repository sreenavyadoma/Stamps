Feature: Print Validation Errors

  Background:
    Given I am signed in to Orders

  @dpo_print_error
  Scenario: Two character minimum for Name & Company with DPO/APO address
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to
    | name  | company | street_address      | city  | state | zip        | country       | phone  |  email |
    | A     |         |Unit 8400, Box 0000  | DPO   | AE    | 09498-9997 | United States |        |        |
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    And Open Customs Form
    Then Customs Form: Set Package Contents to "Merchandise"
    And Customs Form: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Print expecting error "First and Last Name, with two chars each or Full Name with two char First and Last Name or Company Name with two chars is required for both sender and recipient"



    Then Sign out