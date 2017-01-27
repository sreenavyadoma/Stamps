Feature:  Customs Form Data Tooltip Error

  Background:
    Given a valid user is signed in to Web Apps

  @tooltip_customs_form
  Scenario:  Customs Form Data Error
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |

    Then On Order Details form, select service PMI Flat Rate Envelope
    Then On Order Details form, click Edit Form button
    Then Pause for 1 second
    Then Cancel Customs Form
    Then Pause for 1 second
    Then On Order Details form, click Edit Form button
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then On Customs form, uncheck I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then On Customs form, uncheck I agree to the USPS Privacy Act Statement

    Then On Customs form, expect Item Description Tooltip Error is Description is a required field
    Then On Customs form, expect Qty Tooltip Error is Quantity must be greater than 0
    Then On Customs form, expect Unit Price Tooltip Error is Value must be greater than 0
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 50, Origin United States, Tariff 100
    Then Pause for 2 seconds
    Then On Customs form, click Close button
    Then Sign out


