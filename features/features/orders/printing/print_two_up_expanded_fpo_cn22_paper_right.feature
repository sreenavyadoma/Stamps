Feature: User Prints 1 FPO CN22 label on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_fpo_cn22_paper_right
  Scenario: User Prints 1 FPO CN22 label on 8.5x11 - right side
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to domestic address to
      | full_name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box C | 8.5x11 Right Side 1 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then set order details weight to 2 lb 1 oz
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button Sample
    Then click print modal print button
    Then sign out

