Feature: Print 1 Intl CP72 label on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_4x6roll
  Scenario: Print 1 Intl CP72 label on 4x6 Roll
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then on Order Details form, select service PMI Package
    Then on Order Details form, set Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In is United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Sign out
