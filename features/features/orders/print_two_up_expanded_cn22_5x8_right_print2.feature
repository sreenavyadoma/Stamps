Feature: Print 2 Intl CN22 labels on 5.5x8.5 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_cn22_5x8_right_print2
  Scenario: Print 2 Intl CN22 labels on 5.5x8.5 - right side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Lg Env-Flat | 5.5x8.5 Right Side 2 | random           | random           | random | random  | random      | Croatia | random  | random  |
    Then on Order Details form, select service FCMI Large Envelope
    Then on Order Details form, set Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In is United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Pkg-Thick Env | 5.5x8.5 Right Side 1 | random           | random           | random | random  | random      | India | random  | random  |
    Then on Order Details form, select service FCMI Package
    Then on Order Details form, set Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In is United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select right-side label
    Then in Print modal, expect right-side label selected
    Then in Print modal, click Print button


    Then Sign out
