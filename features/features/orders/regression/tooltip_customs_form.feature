Feature:  Customs Form Data Tooltip Error

  Background:
    Given a valid user is signed in to Web Apps

  @tooltip_customs_form
  Scenario:  Customs Form Data Error
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |

    Then set Order Details form service to PMI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then Pause for 1 second
    Then Cancel Customs Form
    Then Pause for 1 second
    Then click Order Details form Edit Form button
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then uncheck Customs form I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then Pause for 1 second
    Then uncheck Customs form I agree to the USPS Privacy Act Statement

    Then expect Customs form Associated Item Description Tooltip Error is Description is a required field
    Then expect Customs form Qty Tooltip Error is Quantity must be greater than 0
    Then expect Customs form Unit Price Tooltip Error is Value must be greater than 0
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 50, Made In United States, Tariff 100
    Then Pause for 2 seconds
    Then close Customs Information form
    Then Sign out


