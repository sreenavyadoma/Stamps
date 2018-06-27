Feature: Print 1 Intl CP72 label on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_4x6roll
  Scenario: Print 1 Intl CP72 label on 4x6 Roll
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4 x 6
    Then click print modal print button Sample
    Then click print modal print button
    Then sign out
