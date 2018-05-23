Feature: Print 1 Intl CP72 label on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_4x6roll
  Scenario: Print 1 Intl CP72 label on 4x6 Roll
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4 x 6
    Then click print modal print button Sample
    Then click print modal print button
    Then sign out
