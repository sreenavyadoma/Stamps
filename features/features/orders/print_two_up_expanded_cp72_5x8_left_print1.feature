Feature: Print 1 Intl CP72 label on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_cp72_5x8_left_print1
  Scenario: Print 1 Intl CP72 label on 5.5x8.5 - left side
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | Chile | random  | random  |
    Then on Order Details form, select service PMI Package
    Then on Order Details form, set Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, select left-side label
    Then in Print modal, expect left-side label selected
    Then in Print modal, click Print button
    Then Sign out


