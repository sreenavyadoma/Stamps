Feature: Print 1 Intl CP72 label with continuation on on 4x6 Roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_roll_continuation
  Scenario: Print 1 Intl CP72 label with continuation on on 4x6 Roll
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name     | company   | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | PMI LFRB |  4x6 Roll | random           | random           | random | random  | random      | Italy   | random  | random  |
    Then set order details service to PMI Large Flat Rate Box
    Then set order details weight to 2 lb 0 oz
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 2, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 3, description random, qty 1, Price 3, Made In United States, Tariff 3
    Then add customs associated item 4, description random, qty 1, Price 4, Made In United States, Tariff 4
    Then add customs associated item 5, description random, qty 1, Price 5, Made In United States, Tariff 5
    Then add customs associated item 6, description random, qty 1, Price 6, Made In United States, Tariff 6
    Then add customs associated item 7, description random, qty 1, Price 7, Made In United States, Tariff 7
    Then add customs associated item 8, description random, qty 1, Price 8, Made In United States, Tariff 8
    Then add customs associated item 9, description random, qty 1, Price 9, Made In United States, Tariff 9
    Then add customs associated item 10, description random, qty 1, Price 10, Made In United States, Tariff 10
    Then add customs associated item 11, description random, qty 1, Price 11, Made In United States, Tariff 11
    Then add customs associated item 12, description random, qty 1, Price 12, Made In United States, Tariff 12
    Then add customs associated item 13, description random, qty 1, Price 13, Made In United States, Tariff 13
    Then add customs associated item 14, description random, qty 1, Price 14, Made In United States, Tariff 14
    Then add customs associated item 15, description random, qty 1, Price 15, Made In United States, Tariff 15
    Then add customs associated item 16, description random, qty 1, Price 16, Made In United States, Tariff 16
    Then add customs associated item 17, description random, qty 1, Price 17, Made In United States, Tariff 17
    Then add customs associated item 18, description random, qty 1, Price 18, Made In United States, Tariff 18
    Then add customs associated item 19, description random, qty 1, Price 19, Made In United States, Tariff 19
    Then add customs associated item 20, description random, qty 1, Price 20, Made In United States, Tariff 20
    Then add customs associated item 21, description random, qty 1, Price 21, Made In United States, Tariff 21
    Then add customs associated item 22, description random, qty 1, Price 22, Made In United States, Tariff 22
    Then add customs associated item 23, description random, qty 1, Price 23, Made In United States, Tariff 23
    Then add customs associated item 24, description random, qty 1, Price 24, Made In United States, Tariff 24
    Then add customs associated item 25, description random, qty 1, Price 25, Made In United States, Tariff 25
    Then add customs associated item 26, description random, qty 1, Price 26, Made In United States, Tariff 26
    Then add customs associated item 27, description random, qty 1, Price 27, Made In United States, Tariff 27
    Then add customs associated item 28, description random, qty 1, Price 28, Made In United States, Tariff 28
    Then add customs associated item 29, description random, qty 1, Price 29, Made In United States, Tariff 29
    Then add customs associated item 30, description random, qty 1, Price 30, Made In United States, Tariff 30
    Then add customs associated item 31, description random, qty 1, Price 30, Made In United States, Tariff 31
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4" x 6" Shipping Label
    Then click print modal print button Sample
    Then click print modal print button
    Then sign out
