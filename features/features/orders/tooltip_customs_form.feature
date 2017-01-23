Feature:  Customs Form Data Tooltip Error

  Background:
    Given I am signed in to Orders

  @tooltip_customs_form
  Scenario:  Customs Form Data Error
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |

    Then Order Details: Select Service PMI Flat Rate Envelope
    Then Order Details: Edit Customs Form
    Then Pause for 1 second
    Then Cancel Customs Form
    Then Pause for 1 second
    Then Order Details: Edit Customs Form
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then Customs Form: Uncheck I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then Customs Form: Uncheck I agree to the USPS Privacy Act Statement

    Then Customs Form: Expect Item Description Tooltip Error is Description is a required field
    Then Customs Form: Expect Qty Tooltip Error is Quantity must be greater than 0
    Then Customs Form: Expect Unit Price Tooltip Error is Value must be greater than 0
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 50, Origin United States, Tariff 100
    Then Pause for 2 seconds
    Then Customs Form: Close Customs Form
    Then Sign out


