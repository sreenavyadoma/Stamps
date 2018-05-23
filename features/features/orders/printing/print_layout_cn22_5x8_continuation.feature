Feature: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cn22_5x8_continuation
  Scenario: Print 1 Intl CP72 label with continuation on 5.5x8.5 - left side
    Then add new order
    Then set Order Details Ship-From to default
    Then set order details ship-to international address to
      | full_name      | company            | street_address_1 | street_address_2 | city   | province| postal_code | country     | phone   |  email  |
      | PMEI PFTE |  5.5x8.5 Left Side | random           | random           | random | random  | random      | Philippines | random  | random  |
    Then set order details service to PMEI Package/Flat/Thick Envelope
    Then set order details weight to 2 lb 0 oz

    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Gift
    Then add Customs Associated Item 1, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 2, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 3, description random, qty 1, Price 1, Made In United States, Tariff 3
    Then add Customs Associated Item 4, description random, qty 1, Price 2, Made In United States, Tariff 4
    Then add Customs Associated Item 5, description random, qty 1, Price 3, Made In United States, Tariff 5
    Then add Customs Associated Item 6, description random, qty 1, Price 1, Made In United States, Tariff 6
    Then add Customs Associated Item 7, description random, qty 1, Price 2, Made In United States, Tariff 7
    Then add Customs Associated Item 8, description random, qty 1, Price 1, Made In United States, Tariff 8
    Then add Customs Associated Item 9, description random, qty 1, Price 1, Made In United States, Tariff 9
    Then add Customs Associated Item 10, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 11, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 12, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 13, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 14, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 15, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 16, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 17, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 18, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 19, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 20, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 21, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 22, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 23, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 24, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 25, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 26, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 27, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 28, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 29, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 30, description random, qty 1, Price 3, Made In United States, Tariff 3
    Then add Customs Associated Item 31, description random, qty 1, Price 3, Made In United States, Tariff 3
    Then add Customs Associated Item 32, description random, qty 1, Price 3, Made In United States, Tariff 3
    Then pause for 4 seconds
    Then set Customs ITN Number to random
    Then pause for 4 seconds
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then pause for 2 seconds
    Then close Customs Information form

    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

    Then sign out
