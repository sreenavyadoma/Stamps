Feature:  Print Curacao

  Background:
    Given a valid user is signed in to Web Apps

  @new_country_code @new_country_code_2
  Scenario: Print Curacao
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code| country | phone   |  email  |
      | random | random  | random           | random           | random | random  | 12345      | Curacao | random  | random  |

    Then on Order Details form, expect Ship-To Country is Curacao
    Then on Order Details form, select service FCMI Large Envelope
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, set Pounds to 2
    Then on Order Details form, Add Item 1, Qty 1, ID Item 1 SKU, Description Item 1 Description
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then Pause for 3 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button
    Then Sign out
