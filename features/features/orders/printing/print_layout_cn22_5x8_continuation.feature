Feature: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cn22_5x8_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name      | company            | street_address1 | street_address2 | city   | province| postal_code | country     | phone   |  email  |
      | PMEI PFTE |  5.5x8.5 Left Side | random           | random           | random | random  | random      | Philippines | random  | random  |
    Then set order details service to PMEI Package/Flat/Thick Envelope
    Then set order details weight to 2 lb 0 oz

    Then click order details form customs form button
    Then set customs package contents to Gift
    Then add customs associated item 1, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 2, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 3, description random, qty 1, Price 1, Made In United States, Tariff 3
    Then add customs associated item 4, description random, qty 1, Price 2, Made In United States, Tariff 4
    Then add customs associated item 5, description random, qty 1, Price 3, Made In United States, Tariff 5
    Then add customs associated item 6, description random, qty 1, Price 1, Made In United States, Tariff 6
    Then add customs associated item 7, description random, qty 1, Price 2, Made In United States, Tariff 7
    Then add customs associated item 8, description random, qty 1, Price 1, Made In United States, Tariff 8
    Then add customs associated item 9, description random, qty 1, Price 1, Made In United States, Tariff 9
    Then add customs associated item 10, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 11, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 12, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 13, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 14, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 15, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 16, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 17, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 18, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 19, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 20, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 21, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 22, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 23, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 24, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 25, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 26, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 27, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 28, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 29, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add customs associated item 30, description random, qty 1, Price 3, Made In United States, Tariff 3
    Then add customs associated item 31, description random, qty 1, Price 3, Made In United States, Tariff 3
    Then add customs associated item 32, description random, qty 1, Price 3, Made In United States, Tariff 3
    Then pause for 4 seconds
    Then set customs itn number to random
    Then pause for 4 seconds
    Then check customs form i agree to the usps privacy act statement
    Then pause for 2 seconds
    Then close customs information form

    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

    Then sign out
